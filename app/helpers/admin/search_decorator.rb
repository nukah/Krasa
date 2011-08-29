Spree::Search::Base.class_eval do
  include TypesHelper
  
  def get_base_scope
    base_scope = @cached_product_group ? @cached_product_group.products.active : Product.active
    base_scope = get_products_of_type(base_scope, type)
    base_scope = get_products_conditions_for(base_scope, keywords) unless keywords.blank?
    
    base_scope = base_scope.on_hand unless Spree::Config[:show_zero_stock_products]
    base_scope = base_scope.group_by_products_id if @product_group.product_scopes.size > 1
    base_scope
  end
  
  def get_products_of_type(base_scope, type)
    if type
      base_scope.of_type(type)
    elsif keywords
      base_scope
    else
      base_scope.of_type(active_type)
    end
  end
  
  def prepare(params)
    @properties[:type] = params[:type].blank? ? nil : params[:type]
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