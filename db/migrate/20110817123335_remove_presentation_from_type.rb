class RemovePresentationFromType < ActiveRecord::Migration
  def self.up
    remove_column :types, :presentation
  end

  def self.down
    add_column :types, :presentation, :string
  end
end
