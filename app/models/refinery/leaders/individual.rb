module Refinery
  module Leaders
    class Individual < Refinery::Core::BaseModel
      self.table_name = 'refinery_leaders_individuals'

      belongs_to :image
      attr_accessible :name, :name_chinese, :biography, :image_id

      validates :name, :presence => true

      has_many :group_individuals
      has_many :groups, :class_name => "Refinery::Leaders::Group", :through => :group_individuals
      attr_accessible :groups

      acts_as_indexed :fields => [:name]
    end
  end
end
