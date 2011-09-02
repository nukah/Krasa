module TypesHelper
  def default_type
    Type.where(:first => true).first
  end
  
  def detect_type
    @action = params[:action]
    @controller = params[:controller]
    
    if @controller == 'products' and @action == 'show' and params[:id]
      Product.get_type(params[:id])
    elsif @controller == 'products' and @action == 'index'
      (!params[:search_type].blank? and params[:search_type] != 'all') ? Type.find(params[:search_type]) : default_type
    elsif @controller == 'taxons' and @action == 'show' and params[:taxon]
      Taxon.get_type(params[:taxon])
    elsif @controller == 'types' and @action == 'show' and params[:type]
      Type.find_by_permalink(params[:type])
    else 
      default_type
    end
  end
end
