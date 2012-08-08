class CreateLeadersPowers < ActiveRecord::Migration

  def up
    create_table :refinery_leaders_powers do |t|
      t.string :name
      t.string :color
      t.timestamps
    end
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
