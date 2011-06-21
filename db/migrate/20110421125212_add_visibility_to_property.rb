class AddVisibilityToProperty < ActiveRecord::Migration
  def self.up
    add_column :properties, :visibility, :boolean, :default => 1
  end

  def self.down
    remove_column :properties, :visiblity
  end
end
