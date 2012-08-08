module Refinery
  module Leaders
    class Individual < Refinery::Core::BaseModel
      self.table_name = 'refinery_leaders_individuals'

      belongs_to :image
      attr_accessible :name, :name_chinese, :biography, :image_id

      validates :name, :presence => true

      has_and_belongs_to_many :groups, :class_name => "Refinery::Leaders::Group", :join_table => 'refinery_leaders_groups_individuals'

      acts_as_indexed :fields => [:name]
    end
  end
end
