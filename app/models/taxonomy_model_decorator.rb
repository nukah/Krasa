Taxonomy.class_eval do
  has_one :type_taxonomy, :dependent => :destroy
  has_one :type, :through => :type_taxonomy, :foreign_key => "taxonomy_id"
end