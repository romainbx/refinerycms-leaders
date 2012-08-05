module Refinery
  module Leaders
    class Group < Refinery::Core::BaseModel
      self.table_name = 'refinery_leaders_groups'

      attr_accessible :name, :position

      validates :name, :presence => true, :uniqueness => true

      has_many :persons, :class_name => "Refinery::Leaders::Person"

      acts_as_indexed :fields => [:name]

      def add_persons person
        persons << person
      end

      def add_persons many_persons
        many_persons.each do |person|
          add_person person
        end
      end

      def remove_person person
        persons.delete person
      end
  end
end
