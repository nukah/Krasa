class Admin::TypesController < Admin::ResourceController
  def new
    render :layout => !request.xhr?
	@type = Type.new
  end
  
  def create
	@type ||= params[:type]
	if @type.save
	  redirect_to :admin_types
	else
	  redirect_to :new_admin_type
	end
  end

  def destroy
	@type = Type.find(params[:id])
	if @type.destroy
	  flash[:notice] = I18n.t('resource_controller.successfuly_removed')
	  respond_with(@type) do |format|
        format.html { redirect_to collection_url }
        format.js   { render :partial => "/admin/shared/destroy" }
      end
	else
	  flash[:notice] = t('error')
	  respond_with(@type) do |format|
		format.html { redirect_to collection_url }
	  end
	end
  end
  
  def edit
	@type = Type.find(params[:id])
	
  end
  
  def index
    @types = Type.all
  end
end
