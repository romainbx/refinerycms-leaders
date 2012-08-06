module Refinery
  module Leaders
    class Person < Refinery::Core::BaseModel
      self.table_name = 'refinery_leaders_persons'

      attr_accessible :name

      validates :name, :presence => true

      has_and_belongs_to_many :groups, :class_name => "Refinery::Leaders::Group"

      acts_as_indexed :fields => [:name]
  end
end
