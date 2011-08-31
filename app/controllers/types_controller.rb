class TypesController < Spree::BaseController
  respond_to :html
  
  def show
    if !Type.exists?(:permalink => params[:type])
      render_404 and return
    end
    @searcher = Spree::Search::Base.new(params)
    @products = @searcher.retrieve_products

    respond_with(@products)
  end
end
