module Refinery
  module Leaders
    class Group < Refinery::Core::BaseModel
      self.table_name = 'refinery_leaders_groups'

      attr_accessible :name, :name_chinese, :name_english, :description

      belongs_to :power, :class_name => 'Refinery::Leaders::Power', :foreign_key => :power_id
      belongs_to :group, :class_name => 'Refinery::Leaders::Group', :foreign_key => :group_id
      attr_accessible :power_id, :group_id

      validates :name, :presence => true

      has_many :group_individuals
      has_many :individuals, :class_name => "Refinery::Leaders::Individual", :through => :group_individuals
      attr_accessible :individuals

      acts_as_indexed :fields => [:name]
    end
  end
end
