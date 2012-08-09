class CreateLeadersPowers < ActiveRecord::Migration

  def up
    create_table :refinery_leaders_powers do |t|
      t.string :name
      t.string :short_name
      t.string :color
      t.string :page_organigramme
      t.text :description
      t.timestamps
    end
  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-leaders"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/leaders/powers"})
    end

    drop_table :refinery_leaders_groups

  end

end
