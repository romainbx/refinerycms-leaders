module Refinery
  module Leaders
    class GroupsController < ::ApplicationController

      def index

      end

      def show
        @group = Refinery::Leaders::Group.find(params[:id])
      end

      def getContentToDisplay
        group = Refinery::Leaders::Group.find(params[:group_id])
        result = "";
        group.group_individuals.each do |gi|
          if !gi.role.empty?
            result += '<div class="chart-inside-node">'
            result += '<div><b>'+gi.role+'</b><br>'+gi.individual.name+'</div>'
            result += '<img src="'+gi.individual.image.thumbnail("40x").url+'">'
            result += '</div>'
          end
        end
        group.groups.each do |subgroup|
          result += '<div class="chart-inside-node">'
          result += '<div><b>'+subgroup.name+'</b><br>'+subgroup.name_english+'<br>'+subgroup.name_chinese+'</div>'
          result += '</div>'
        end
        render :json => result.to_json
      end

    end
  end
end
