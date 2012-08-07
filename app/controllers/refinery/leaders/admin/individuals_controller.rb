module Refinery
  module Leaders
    module Admin
      class IndividualsController < ::Refinery::AdminController

        crudify :'refinery/leaders/individual', :title_attribute => 'name', :xhr_paging => true
        before_filter :find_current_individual, :only => [:show, :edit]

        def index
          @individuals = Refinery::Leaders::Individual.paginate(:page => params[:page])
        end

        def new
          @individual=Refinery::Leaders::Individual.new
        end

        def show
        end

        def edit
        end

      private

        def find_current_individual
          @individual = Refinery::Leaders::Individual.find params[:id]
        end

      end
    end
  end
end
