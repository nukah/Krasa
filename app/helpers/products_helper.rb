module ProductsHelper
  def product_price(product_or_variant, options={})
    options.assert_valid_keys(:format_as_currency, :show_vat_text)
    options.reverse_merge! :format_as_currency => true, :show_vat_text => Spree::Config[:show_price_inc_vat]

    amount = product_or_variant.price
    amount += Calculator::Vat.calculate_tax_on(product_or_variant) if Spree::Config[:show_price_inc_vat]
    options.delete(:format_as_currency) ? format_price(amount, options) : amount
  end

  def product_bestsellers(count, taxon = nil,start = 1.week.ago,finish = Time.now)
    SQL = "select v.product_id,sum(li.quantity) sum from orders ord join line_items li on li.order_id = ord.id and ord.state == 'complete' join variants v on v.id = li.variant_id group by v.product_id;"
    #TODO
  end
end