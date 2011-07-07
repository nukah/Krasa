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
  	@taxons = @type.taxons
  	@products_count = Hash.new
  	@taxons.each do |taxon|
  	  @products_count[taxon.id] = Product.joins(:taxons).where('taxons.parent_id' => taxon.id).count
    end
  end
  
  # ajax method to add taxon to type
  def add
  end
  
  # ajax method to remove taxon from type
  def remove
    ## TODO form_for @taxons
    if @type.taxons.delete_all(:taxon_id => params[:taxon_id])
      flash.notice = t('taxon_removed_successfully')
    else
      flash[:error] = t('error')
    end
    redirect_to admin_type_edit(@type)
  end
  
  def index
    @types = Type.all
  end
  
  def available
    @available_taxons = Taxon.where(:parent_id => nil).where("id not in (?)", @taxons.map(&:id)).all
  end
end
