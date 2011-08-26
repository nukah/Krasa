module ProductsHelper
  def product_price(product_or_variant, options={})
    options.assert_valid_keys(:format_as_currency, :show_vat_text)
    options.reverse_merge! :format_as_currency => true, :show_vat_text => Spree::Config[:show_price_inc_vat]

    amount = product_or_variant.price
    amount += Calculator::Vat.calculate_tax_on(product_or_variant) if Spree::Config[:show_price_inc_vat]
    options.delete(:format_as_currency) ? format_price(amount, options) : amount
  end

  def product_bestsellers(taxon = "not nil", count = 5, start = 1.week.ago, finish = Time.now)
    objects = Order.between(start,finish).find(:all,
                                               :joins => "JOIN line_items li ON li.order_id = orders.id AND orders.state == 'complete' " + "JOIN variants v ON v.id = li.variant_id " + "JOIN products_taxons pt ON pt.product_id = v.product_id " + "JOIN taxons t ON t.id = pt.taxon_id and t.parent_id = #{taxon}",
                                               :select => "v.product_id, sum(li.quantity) sum",
                                               :group => "v.product_id",
                                               :limit => count)
    objects.map { |object| Product.find(object.product_id) }
  end
  
  def product_breadcrumbs(product, separator = "&nbsp;->&nbsp;")
    crumbs = []
    taxon = Taxon.of_product(product).first
    top_taxon = 
    
    crumbs << content_tag(:span, link_to(t('home'), root_url), :id => 'root_link')
    crumbs << taxon.ancestors.collect { |anc| content_tag(:span, link_to(anc.name, seo_url(anc)), :id => 'top_link') } unless taxon.ancestors.empty?
    crumbs << content_tag(:span, link_to(taxon.name, seo_url(taxon)), :id => 'taxon_link')
    crumbs << content_tag(:span, link_to(product.name, seo_url(product)), :id => 'product_link')
    crumb_list = raw(crumbs.flatten.map{|li| li.mb_chars }.join(separator))
    content_tag(:div, crumb_list + tag(:br, {:class => 'clear'}, false, true), :id => 'breadcrumbs')
  end
end