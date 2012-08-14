module Refinery
  module Leaders
    class Group < Refinery::Core::BaseModel
      include ActionView::Helpers::TextHelper
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

      def name_with_power_name
        power_name = self.power.name
        power_name = self.power.short_name if self.power.short_name
        return power_name + " - " + truncate(self.name, :length=>60)
      end
    end
  end
end
