Product.class_eval do
  scope :of_type, lambda { |type| joins('LEFT JOIN products_taxons pt ON products.id = pt.product_id',
                                                 'LEFT JOIN taxons t ON pt.taxon_id = t.id',
                                                 'LEFT JOIN type_taxonomies tt ON tt.taxonomy_id = t.taxonomy_id')
                                          .where('tt.type_id = ? and t.position > 0', type) 
                          }
  def to_param
    return permalink if permalink.present?
    name.to_url.gsub("'","")
  end
  
  def self.active
    Product.of_type(Type.where(:first => true))
  end
end