class CreateLeadersMapLinks < ActiveRecord::Migration

  def up
    create_table :refinery_leaders_map_links do |t|
      t.string :name
      t.integer :top
      t.integer :left
      t.integer :group_id
      t.integer :width, :default => 100
      t.integer :height, :default => 20
      t.integer :map_id
      t.timestamps
    end

    add_index :refinery_leaders_map_links, :group_id
    add_index :refinery_leaders_map_links, :map_id
  end

  def down
  end

end
