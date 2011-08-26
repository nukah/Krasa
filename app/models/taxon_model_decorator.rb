Taxon.class_eval do
  scope :of_product, lambda { |product| Taxon.joins('LEFT JOIN products_taxons pt on pt.taxon_id = taxons.id').where('pt.product_id = ?', product.id)}
end