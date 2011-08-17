class AddPermalinkToType < ActiveRecord::Migration
  def self.up
    add_column :types, :permalink, :string
    
    add_index :types, :permalink
  end

  def self.down
    remove_column :types, :permalink
    
    remove_index :types, :permalink
  end
end
