Taxon.class_eval do
  has_one :type_taxons, :class_name => "TypeTaxon"
  has_one :type, :through => :type_taxons, :foreign_key => "taxon_id"
  scope :top, where(:parent_id => nil)

  attr_accessor :taxon_type
  
  def taxon_type
    if self.parent_id
      Taxon.find(self.parent_id).type
    end
  end
end
