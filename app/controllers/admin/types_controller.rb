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
  	@tax = @type.taxonomies
  	@products_count = Hash.new
  	@tax.each do |taxon|
  	  @products_count[taxon.root] = Product.joins(:taxons).where('taxons.parent_id' => taxon.root).count
    end
  end

  def add
	  @taxonomy = Taxonomy.find(params[:taxonomy_id])
    if @type.taxonomies << @taxonomy
      render :locals => { :taxon => @taxonomy, :product_count => Product.joins(:taxons).where('taxons.parent_id' => @taxonomy.root).count }
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
    @taxonomy = Taxonomy.find(params[:taxonomy_id])
    if @type.taxonomies.delete(@taxonomy)
      render :locals => { :taxon => @taxonomy }
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
	  @taxonomies = @type.taxonomies
    @available_taxons ||= @taxonomies.empty? ? Taxonomy.all : Taxonomy.where("id not in (?)", @taxonomies.map(&:id)).all										  
  end
end
