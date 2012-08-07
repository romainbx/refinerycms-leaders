module Refinery
  module Leaders
    class GroupsController < ::ApplicationController

      #before_filter :find_all_groups
      #before_filter :find_page

      def index

      end

      def show
        @group = Refinery::Leaders::Group.find(params[:id])
      end

    end
  end
end
