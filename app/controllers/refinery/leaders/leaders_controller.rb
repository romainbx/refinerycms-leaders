module Refinery
  module Leaders
    class LeadersController < ::ApplicationController

      before_filter :verify_user

      def index
      end

      def verify_user
        if !current_refinery_user
          redirect_to '/refinery'
        end
      end
    end
  end
end
