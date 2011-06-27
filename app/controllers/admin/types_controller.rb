class Admin::TypesController < Admin::ResourceController
  def new
    render :layout => !request.xhr?
	@type = Type.new
  end
  
  # def create
  #   @type ||= Type.new(params[:type])
  #   if @type.save
  #     redirect_to admin_types_path
  #   else
  #     redirect_to admin_types_new_path
  #     flash[:notice] = "Error"
  #   end
  # end
  
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
	  flash[:notice] = "Successful"
	  redirect_to :admin_types
	end
  end
  
  def index
    @types = Type.all
  end
end
