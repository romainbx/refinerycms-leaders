module Refinery
  module Leaders
    class Power < Refinery::Core::BaseModel
      self.table_name = 'refinery_leaders_powers'

      attr_accessible :name, :color, :page_organigramme, :short_name, :description

      validates :name, :presence => true

      acts_as_indexed :fields => [:name]
    end
  end
end
