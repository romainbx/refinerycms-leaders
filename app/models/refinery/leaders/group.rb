module Refinery
  module Leaders
    class Group < Refinery::Core::BaseModel
      self.table_name = 'refinery_leaders_groups'

      attr_accessible :name

      belongs_to :group, :class_name => 'Refinery::Leaders::Group', :foreign_key => :group_id
      attr_accessible :group_id

      validates :name, :presence => true

      has_and_belongs_to_many :individuals, :class_name => "Refinery::Leaders::Individual", :join_table => 'refinery_leaders_groups_individuals'
      attr_accessible :individuals
      acts_as_indexed :fields => [:name]
    end
  end
end
