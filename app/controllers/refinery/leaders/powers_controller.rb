module Refinery
  module Leaders
    class PowersController < ::ApplicationController

      def show
        @power = Refinery::Leaders::Power.find(params[:id])
        @groups = Refinery::Leaders::Group.where(:power_id => params[:id])
      end
    end
  end
end
