module Refinery
  module Leaders
    class IndividualsController < ::ApplicationController

      #before_filter :find_all_groups
      #before_filter :find_page

      def index

      end

      def show
        @individual = Refinery::Leaders::Individual.find(params[:id])
      end

    end
  end
end
