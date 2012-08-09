class CreateLeadersGroups < ActiveRecord::Migration

  def up
    create_table :refinery_leaders_groups do |t|
      t.string :name
      t.string :name_english
      t.string :name_chinese
      t.integer :group_id
      t.integer :power_id
      t.text :description
      t.timestamps
    end
    add_index :refinery_leaders_groups, :group_id
    add_index :refinery_leaders_groups, :power_id
  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-leaders"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/leaders/groups"})
    end

    drop_table :refinery_leaders_groups

  end

end
