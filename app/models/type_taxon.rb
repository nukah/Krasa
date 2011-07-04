class TypeTaxon < ActiveRecord::Base
  belongs_to :type
  belongs_to :taxon
  validates :type, :presence => true
end
