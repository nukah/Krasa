class CreateTypeTaxonomies < ActiveRecord::Migration
  def self.up
    create_table :type_taxonomies, :id => false do |t|
      t.references :taxonomy
      t.references :type
    end

    add_index :type_taxonomies, :taxonomy_id
    add_index :type_taxonomies, :type_id
  end

  def self.down
    drop_table :type_taxonomies
  end
end
