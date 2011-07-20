class TypeTaxon < ActiveRecord::Base
  belongs_to :type
  belongs_to :taxon
  validates :type, :presence => true
  validate :uniqueness_of_pair
  
  def uniqueness_of_pair
    errors.add(:base, "such pair already exists") if
      TypeTaxon.where(:type_id => type_id, :taxon_id => taxon_id).exists?
  end
end
