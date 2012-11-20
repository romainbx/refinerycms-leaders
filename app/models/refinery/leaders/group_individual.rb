module Refinery
  module Leaders
    class GroupIndividual < Refinery::Core::BaseModel
      self.table_name = 'refinery_leaders_group_individuals'

      default_scope :order => 'position ASC'

      belongs_to :group
      belongs_to :individual

      attr_accessible :role, :position
    end
  end
end
