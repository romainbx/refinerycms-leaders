module Refinery
  module Leaders
    module Admin
      class LeadersController < ::Refinery::AdminController

        def index
          @powers = Refinery::Leaders::Power.unscoped.order("name ASC").limit(10)
          @groups = Refinery::Leaders::Group.unscoped.order("created_at DESC").limit(10)
          @individuals = Refinery::Leaders::Individual.unscoped.order("created_at DESC").limit(14)
        end

      end
    end
  end
end
