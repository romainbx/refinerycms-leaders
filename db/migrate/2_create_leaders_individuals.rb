class CreateLeadersIndividuals < ActiveRecord::Migration

  def up
    create_table :refinery_leaders_individuals do |t|
      t.string :name
      t.string :name_chinese
      t.text :biography
      t.integer :image_id
      t.timestamps
    end
    add_index :refinery_leaders_individuals, :image_id
  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-leaders"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/leaders/individuals"})
    end

    drop_table :refinery_leaders_individuals

  end

end
