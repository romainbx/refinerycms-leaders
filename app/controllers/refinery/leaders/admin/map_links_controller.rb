module Refinery
  module Leaders
    module Admin
      class MapLinksController < ::Refinery::AdminController
        crudify :'refinery/leaders/map_link', :title_attribute => 'name', :xhr_paging => true
        before_filter :find_current_map_link, :only => [:show, :edit]

        def index
          @map_links = Refinery::Leaders::MapLink.paginate(:page => params[:page])
        end

        def new
          @map_link=Refinery::Leaders::MapLink.new
        end

        def show
        end

        def edit
        end

        def update
          binding.pry
          map_link = Refinery::Leaders::MapLink.find(params[:id])
          map_link.name = params[:map_link][:name]
          map_link.top = params[:map_link][:top]
          map_link.left = params[:map_link][:left]
          map_link.width = params[:map_link][:width]
          map_link.height = params[:map_link][:height]
          map_link.group_id = params[:group_id]
          map_link.save
          redirect_to refinery.leaders_admin_map_links_path
        end

      private

        def find_current_map_link
          @map_link = Refinery::Leaders::MapLink.find params[:id]
        end
      end
    end
  end
end
