class CreateLeadersGroupsPersonsJoinTable < ActiveRecord::Migration
  def change
    create_table :refinery_leaders_groups_persons, :id => false do |t|
      t.integer :group_id
      t.integer :person_id
    end
  end
end