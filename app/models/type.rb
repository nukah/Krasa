class Type < ActiveRecord::Base
  validates :name, :presence => true
  
  before_save :check_for_being_first, :set_permalink
    
  has_many :type_taxonomies, :dependent => :destroy
  has_many :taxonomies, :through => :type_taxonomies, :foreign_key => "type_id"

  attr_accessible :name, :first, :permalink
  attr_accessor :of_product
  
  def self.of_product (product)
    Product.find(product).taxons.first.taxon_type
  end
  
  private
  def set_permalink
    self.permalink.blank? ? self.permalink = self.name.to_url.gsub("'","") : []
  end
  
  def check_for_being_first
    if self.first_changed?
      Type.where("name <> '#{self.name}'").update_all(:first => false)
    end
  end
  
end