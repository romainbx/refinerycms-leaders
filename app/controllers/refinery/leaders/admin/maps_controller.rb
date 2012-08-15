module Refinery
  module Leaders
    module Admin
      class MapsController < ::Refinery::AdminController

        crudify :'refinery/leaders/map', :title_attribute => 'name', :xhr_paging => true
        before_filter :find_current_map, :only => [:show, :edit]

        def index
          @maps = Refinery::Leaders::Map.paginate(:page => params[:page])
        end

        def new
          @map=Refinery::Leaders::Map.new
        end

        def show
        end

        def edit
        end

        def getImageUrl
          map = Refinery::Leaders::Map.find(params[:map_id])
          render :text => map.image.url
        end

      private

        def find_current_map
          @map = Refinery::Leaders::Map.find params[:id]
        end

      end
    end
  end
end
