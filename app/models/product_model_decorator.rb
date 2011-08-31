Product.class_eval do
  scope :of_type, lambda { |t| joins('LEFT JOIN products_taxons pt ON products.id = pt.product_id ' + 
                                                 'LEFT JOIN taxons t ON pt.taxon_id = t.id ' +
                                                 'LEFT JOIN type_taxonomies tt ON tt.taxonomy_id = t.taxonomy_id')
                                          .where('tt.type_id in (?)', t) 
                          }
  scope :get_type, lambda { |product| joins('LEFT JOIN type_taxonomies tt ON tt.taxonomy_id = tx.taxonomy_id',
                                              'LEFT JOIN taxons tx ON tx.id = pt.taxon_id',
                                              'LEFT JOIN products_taxons pt ON pt.product_id = products.id',
                                              'LEFT JOIN types ON t.id = tt.type_id')
                                              .where('p.permalink = ?', product)
                            }
  def to_param
    return permalink if permalink.present?
    name.to_url.gsub("'","")
  end
end