class Type < ActiveRecord::Base
  validates :name, :presentation, :presence => true
  
  before_save :check_for_being_first
    
  has_many :type_taxonomies, :dependent => :destroy
  has_many :taxons, :through => :type_taxonomies, :source => :taxon
  
  attr_accessible :name, :presentation, :first
  private
  def check_for_being_first
    if self.first?
      Type.update_all(:first => false, :name => !self.name)
    end
  end
  
end
