Product.class_eval do
  scope :of_type, lambda { |type| joins('LEFT JOIN products_taxons pt ON products.id = pt.product_id',
                                                 'LEFT JOIN taxons t ON pt.taxon_id = t.id',
                                                 'JOIN type_taxons tt ON tt.taxon_id = t.parent_id')
                                          .where('tt.type_id = ?', type) 
                          }
end