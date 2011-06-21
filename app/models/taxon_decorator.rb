Taxon.class_eval do
  has_one :type, :through => :type_taxonomies, :foreign_key => "taxonomy_id"
end