class TypesController < Spree::BaseController
  def show
    Type.exists?(:permalink => params[:type]) ? session[:active_type] = params[:type] : render_404
    redirect_to root_url
  end
end
