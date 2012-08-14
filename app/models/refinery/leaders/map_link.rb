module Refinery
  module Leaders
    class MapLink < Refinery::Core::BaseModel
      self.table_name = 'refinery_leaders_map_links'
      default_scope :order => 'name ASC'

      belongs_to :group, :class_name => 'Refinery::Leaders::Group', :foreign_key => :group_id
      belongs_to :map, :class_name => 'Refinery::Leaders::Map', :foreign_key => :map_id

      attr_accessible :name, :top, :left, :group_id, :width, :height, :map_id

      acts_as_indexed :fields => [:name]
    end
  end
end
