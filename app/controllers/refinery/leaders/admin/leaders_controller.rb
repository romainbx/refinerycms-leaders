module Refinery
  module Leaders
    module Admin
      class LeadersController < ::Refinery::AdminController

        def index
          @groups = Refinery::Leaders::Group.order("created_at DESC").limit(10)
          @individuals = Refinery::Leaders::Individual.order("created_at DESC").limit(10)
        end

      end
    end
  end
end
