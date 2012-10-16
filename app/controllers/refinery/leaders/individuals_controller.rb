module Refinery
  module Leaders
    class IndividualsController < ::ApplicationController

      #before_filter :find_all_groups
      #before_filter :find_page

      def index
        @individuals = Refinery::Leaders::Individual.limit(20).page(params[:page])
      end

      def show
        @individual = Refinery::Leaders::Individual.find(params[:id])
      end

    end
  end
end
