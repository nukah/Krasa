class Type < ActiveRecord::Base
  validates :name, :presentation, :presence => true
  
  before_save :check_for_being_first
    
  has_many :type_taxons, :dependent => :destroy
  has_many :taxons, :through => :type_taxons, :foreign_key => "type_id"
  
  attr_accessible :name, :presentation, :first

  scope :products, lambda()

  private
  def check_for_being_first
    if self.first?
      Type.where("name <> '{self.name}'").update_all(:first => false)
    end
  end
  
end
