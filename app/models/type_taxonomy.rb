class TypeTaxonomy < ActiveRecord::Base
  belongs_to :type
  belongs_to :taxonomy
  validates :type, :presence => true
  validate :uniqueness_of_pair
  
  def uniqueness_of_pair
    errors.add(:base, "such pair already exists") if
      TypeTaxonomy.where(:type_id => type_id, :taxonomy_id => taxonomy_id).exists?
  end
end
