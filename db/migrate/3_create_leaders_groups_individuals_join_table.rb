class CreateLeadersGroupsIndividualsJoinTable < ActiveRecord::Migration
  def change
    create_table :refinery_leaders_groups_individuals do |t|
      t.integer :group_id
      t.integer :individual_id
      t.string :role
      t.timestamps
    end
    add_index :refinery_leaders_groups_individuals, :group_id
    add_index :refinery_leaders_groups_individuals, :individual_id
  end
end
