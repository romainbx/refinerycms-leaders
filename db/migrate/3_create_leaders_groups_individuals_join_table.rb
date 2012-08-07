class CreateLeadersGroupsIndividualsJoinTable < ActiveRecord::Migration
  def change
    create_table :refinery_leaders_groups_individuals, :id => false do |t|
      t.integer :group_id
      t.integer :individual_id
    end
    add_index :refinery_leaders_groups_individuals, [:group_id, :individual_id], :name => 'groups_individuals_group_id_individual_id'
  end
end
