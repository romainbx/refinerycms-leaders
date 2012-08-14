module Refinery
  module Leaders
    class PowersController < ::ApplicationController

      def show
        @power = Refinery::Leaders::Power.find(params[:id])
        @groups = Refinery::Leaders::Group.where(:power_id => params[:id])
      end

      def organigramme
        @power = Refinery::Leaders::Power.find(params[:id])
        @groups = Refinery::Leaders::Group.where(:power_id => params[:id])
      end

      def map
        @power = Refinery::Leaders::Power.find(params[:id])
        @groups = Refinery::Leaders::Group.where(:power_id => params[:id])
        @map_links = Refinery::Leaders::MapLink.where(:map_id => @power.map_id)
      end
    end
  end
end
