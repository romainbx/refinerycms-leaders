class AddPositionToIndividual < ActiveRecord::Migration
  def change
    add_column :refinery_leaders_individuals, :position, :integer
  end
end
