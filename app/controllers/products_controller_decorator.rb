ProductsController.class_eval do  
  def index
    @searcher = Spree::Search::Base.new(params)
    @products = @searcher.retrieve_products

    respond_with(@products)
  end
  
  def show
    @product = Product.find_by_permalink!(params[:id])
    return unless @product

    @variants = Variant.active.includes([:option_values, :images]).where(:product_id => @product.id)
    @product_properties = ProductProperty.includes(:property).where(:product_id => @product.id)
															.where('properties.visibility = ?', true)
    @selected_variant = @variants.detect { |v| v.available? }
    
    referer = request.env['HTTP_REFERER']

    if referer && referer.match(HTTP_REFERER_REGEXP)
      @taxon = Taxon.find_by_permalink($1)
    end

    respond_with(@product)
  end
end