Spree::Search::Base.class_eval do
  log = Logger.new(STDOUT)
  include TypesHelper
  def retrieve_products
    base_scope = get_base_scope.of_type(active_type)
    log.info('active_type is: ' + active_type)
    @products_scope = @product_group.apply_on(base_scope)
    curr_page = manage_pagination && keywords ? 1 : page
    log.info('product list is: ' + @products_scope)
    @products = @products_scope.paginate({
        :include  => [:images, :master],
        :per_page => per_page,
        :page     => curr_page
      })
  end
end