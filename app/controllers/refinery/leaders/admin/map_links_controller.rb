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

      private

        def find_current_map_link
          @map_link = Refinery::Leaders::MapLink.find params[:id]
        end
      end
    end
  end
end
