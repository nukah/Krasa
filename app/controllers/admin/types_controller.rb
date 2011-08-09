class Admin::TypesController < Admin::ResourceController
  respond_to :rjs, :only => [:add, :remove]
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
  	  flash[:notice] = I18n.t('resource_controller.successfully_removed')
  	  respond_with(@type) do |format|
          format.html { redirect_to collection_url }
          format.js   { render :partial => "/admin/shared/destroy" }
        end
  	else
  	  flash[:error] = I18n.t('errors.delete_type') 
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

  def add
	  @taxon = Taxon.find(params[:taxon_id])
    if @type.taxons << @taxon
      render :locals => { :taxon => @taxon, :product_count => Product.joins(:taxons).where('taxons.parent_id' => @taxon.id).count }
    else
      flash[:error] = I18n.t("errors.add_taxon_to_type")
      render :update do |p|
        p.reload
      end
    end
  rescue ActiveRecord::RecordNotFound
	  respond_with(@type) do |format|
  	  format.js { redirect_to edit_admin_type_path(@type) }
   	end
  end

  def remove
    @taxon = Taxon.find(params[:taxon_id])
    if @type.taxons.delete(@taxon)
      render :locals => { :taxon => @taxon }
    else
      flash[:error] = I18n.t("errors.remove_taxon_from_type")
      render :update do |p|
        p.reload
      end
    end
  rescue ActiveRecord::RecordNotFound
    flash[:error] = I18n.t("record_not_found", :type => 'taxon')
    redirect_to edit_admin_type_path(@type)
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
