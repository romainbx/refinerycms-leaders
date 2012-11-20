class AddPositionToIndividual < ActiveRecord::Migration
  def change
    add_column :refinery_leaders_group_individuals, :position, :integer, :default => 99
  end
end
