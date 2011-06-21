class Admin::TypesController < Admin::ResourceController
  def new
    render :layout => !request.xhr?
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
  
  def index
    @types = Type.find(:all)
  end
end
