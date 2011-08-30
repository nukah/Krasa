class TypesController < Spree::BaseController
  def show
    if !Type.exists?(:permalink => params[:type])
      render_404 and return
    else
      type = Type.find_by_permalink(params[:type])
    end
    @products = Product.of_type(type).active
    per_page = params[:per_page].blank? ? Spree::Config[:products_per_page] : params[:per_page].to_i
    cur_page = params[:cur_page].blank? ? 1 : params[:cur_page]
    @products = @products.paginate({
        :include  => [:images, :master],
        :per_page => per_page,
        :page     => cur_page
      })
    
    render 'products/index', :locals => { :products => @products }
  end
end
