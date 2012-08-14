module Refinery
  module Leaders
    class Power < Refinery::Core::BaseModel
      self.table_name = 'refinery_leaders_powers'

      belongs_to :map, :class_name => 'Refinery::Leaders::Map', :foreign_key => :map_id
      attr_accessible :name, :color, :page_organigramme, :short_name, :description, :map_id

      validates :name, :presence => true

      acts_as_indexed :fields => [:name]
    end
  end
end
