class TypesController < Spree::BaseController
  def show
    @type = Type.find(params[:type]) || render_404
    render :layout => true
  end
end
