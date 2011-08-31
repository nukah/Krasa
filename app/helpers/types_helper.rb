module TypesHelper
  def default_type
    Type.where(:first => true).first
  end
  
  def detect_type
    if params[:controller] == 'products' and params[:action] == 'show'
      type = Product.get_type(params[:id])
    #elsif params[:controller] == 'products' and params[:action] == 'index'
    #  1
    elsif params[:controller] == 'taxons' and params[:action] == 'show'
      type = Taxon.get_type(params[:taxon])
    elsif params[:controller] == 'types' and params[:action] == 'show'
      type = Type.find_by_permalink(params[:type])
    else 
      type = default_type
    end
    type
  end
end
