ProductController.class_eval do
  @product_properties = ProductProperty.find_all_by_product_id(@product.id,
                          :include => [:property], :conditions => ['properties.visibility = ?', true])
end