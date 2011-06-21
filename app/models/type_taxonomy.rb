class TypeTaxonomy < ActiveRecord::Base
  belongs_to :type
  belongs_to :type_taxonomy
  validates :type, :presence => true
end
