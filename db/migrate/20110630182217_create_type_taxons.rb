class CreateTypeTaxons < ActiveRecord::Migration
  def self.up
    create_table :type_taxons, :id => false do |t|
      t.references :type
      t.references :taxon
    end
	
    add_index :type_taxons, :taxon_id
    add_index :type_taxons, :type_id
 
  end

  def self.down
    drop_table :type_taxons
  end
end
