Taxon.class_eval do
  has_one :type, :through => :type_taxons, :foreign_key => "taxonomy_id", :conditions => "parent_id is null"
  scope :top, where(:parent_id => nil)
end