class CreateLeadersMaps < ActiveRecord::Migration

  def up
    create_table :refinery_leaders_maps do |t|
      t.string :name
      t.integer :image_id
      t.timestamps
    end
    add_index :refinery_leaders_maps, :image_id
  end

  def down
  end

end
