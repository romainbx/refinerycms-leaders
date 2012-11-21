class AddPositionToGroup < ActiveRecord::Migration
  def change
    add_column :refinery_leaders_groups, :position, :integer, :default => 99
  end
end
