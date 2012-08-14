module Refinery
  module Leaders
    class Map < Refinery::Core::BaseModel
      self.table_name = 'refinery_leaders_maps'
      default_scope :order => 'name ASC'

      belongs_to :image
      attr_accessible :name, :image_id

      acts_as_indexed :fields => [:name]
    end
  end
end
