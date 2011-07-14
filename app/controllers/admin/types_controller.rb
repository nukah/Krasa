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
  	  flash[:notice] = "Successfully removed" 
  	  respond_with(@type) do |format|
          format.html { redirect_to collection_url }
          format.js   { render :partial => "/admin/shared/destroy" }
        end
  	else
  	  flash[:error] = "Error while type delete"
  	  respond_with(@type) do |format|
  		format.html { redirect_to collection_url }
  	  end
  	end
  end
  
  def edit
  	@tax = @type.taxons
  	@products_count = Hash.new
  	@tax.each do |taxon|
  	  @products_count[taxon.id] = Product.joins(:taxons).where('taxons.parent_id' => taxon.id).count
    end
  end
 

  #TODO: refresh page after adding/removing
  def add
	@taxon = Taxon.find(params[:taxon_id])
	if @type.taxons << @taxon
	  flash[:notice] = "Taxon added"
	  respond_with(@type) do |format|
		format.js { redirect_to edit_admin_type_path(@type) }
	  end
	else
	  flash[:error] = "Error while adding taxon"
	end
  end
  
  def remove
	@taxon = Taxon.find(params[:taxon_id])
	if @type.taxons.delete(@taxon)
      flash.notice = t('taxon_removed_successfully')
	  redirect_to edit_admin_type_url(@type)
    else
      flash[:error] = t('error')
    end
  end
  
  def index
    @types = Type.all
  end
  
  def available
	@type = Type.find(params[:type])
	@taxons = @type.taxons
    @available_taxons ||= @taxons.empty? ? Taxon.top : Taxon.top.where("id not in (?)", @taxons.map(&:id)).all										  
  end
end
