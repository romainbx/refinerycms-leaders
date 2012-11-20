module Refinery
  module Leaders
    class IndividualsController < ::ApplicationController

      #before_filter :find_all_groups
      #before_filter :find_page

      def index

        if params.has_key? :alpha
          @individuals = Refinery::Leaders::Individual.all
        else
          @powers = Refinery::Leaders::Power.all
        end
      end

      def show
        @individual = Refinery::Leaders::Individual.find(params[:id])
      end

    end
  end
end
