module Refinery
  module Leaders
    module Admin
      class PowersController < ::Refinery::AdminController
        crudify :'refinery/leaders/power', :title_attribute => 'name', :xhr_paging => true
        before_filter :find_current_power, :only => [:show, :edit]

        def index
          @powers = Refinery::Leaders::Power.paginate(:page => params[:page])
        end

        def new
          @power=Refinery::Leaders::Power.new
        end

        def show
        end

        def edit
        end

      private

        def find_current_power
          @power = Refinery::Leaders::Power.find params[:id]
        end
      end
    end
  end
end
