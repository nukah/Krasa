Spree::Search::Base.class_eval do
  include TypesHelper
  
  def get_base_scope
    base_scope = @cached_product_group ? @cached_product_group.products.active : Product.active
    base_scope = get_appropriate_scope(base_scope)
    base_scope = get_products_conditions_for(base_scope, keywords) unless keywords.blank?
    
    base_scope = base_scope.on_hand unless Spree::Config[:show_zero_stock_products]
    base_scope
  end
  
  def get_appropriate_scope(base_scope)
    if !type.blank?
      base_scope.of_type(type)
    elsif !search_type.blank?
      base_scope.of_type(search_type)
    elsif !taxon.blank?
      base_scope.in_taxon(taxon)
    else
      base_scope.of_type(default_type)
    end
  end
  
  def prepare(params)
    @properties[:search_type] = params[:search_type].blank? ? nil : params[:search_type] == 'all' ? Type.select(:id).all : params[:search_type]
    @properties[:type] = params[:type].blank? ? nil : Type.find_by_permalink(params[:type]) or nil
    @properties[:taxon] = params[:taxon].blank? ? nil : Taxon.find(params[:taxon])
    @properties[:keywords] = params[:keywords]

    per_page = params[:per_page].to_i
    @properties[:per_page] = per_page > 0 ? per_page : Spree::Config[:products_per_page]
    @properties[:page] = (params[:page].to_i <= 0) ? 1 : params[:page].to_i
    
    if !params[:order_by_price].blank?
      @product_group = ProductGroup.new.from_route([params[:order_by_price]+"_by_master_price"])
    elsif params[:product_group_name]
      @cached_product_group = ProductGroup.find_by_permalink(params[:product_group_name])
      @product_group = ProductGroup.new
    elsif params[:product_group_query]
      @product_group = ProductGroup.new.from_route(params[:product_group_query].split("/"))
    else
      @product_group = ProductGroup.new
    end
    @product_group = @product_group.from_search(params[:search]) if params[:search]
  end
end