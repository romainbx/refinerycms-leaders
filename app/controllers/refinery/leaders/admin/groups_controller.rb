module Refinery
  module Leaders
    module Admin
      class GroupsController < ::Refinery::AdminController

        crudify :'refinery/leaders/group', :title_attribute => 'name', :xhr_paging => true
        before_filter :find_current_group, :only => [:show, :edit]
        before_filter :check_current_user_role, :only => [:show, :edit, :destroy]
        before_filter :check_before_destroy, :only => :destroy
        before_filter :check_before_edit, :only => :edit
        before_filter :find_individuals, :only => [:new, :edit, :update]

        def index
          @groups = Refinery::Leaders::Group.paginate(:page => params[:page])
        end

        def show
          @individuals = @group.individuals.paginate(:page => params[:page])
        end

        def edit
          respond_to do |format|
            format.js {render :layout => false}
            format.html
          end
        end

        def create
          group = Refinery::Leaders::Group.new
          group.name = params[:group][:name]
          ids = params[:group][:individuals].split(',')
          group.individuals = Refinery::Leaders::Individual.find(ids)
          group.save!
          redirect_to refinery.leaders_admin_groups_path
        end

        def update
          group = Refinery::Leaders::Group.find(params[:id])
          ids = params[:group][:individuals].split(',')
          group.individuals = Refinery::Leaders::Individual.find(ids)
          redirect_to refinery.leaders_admin_groups_path
        end

        def add_individuals
          @group = Refinery::Leaders::Group.find(params[:id])
          @individuals = Refinery::Leaders::Individual.where(:id => params[:individual_ids])
          @group.individuals = @group.individuals + @individuals.to_a
          @group.save
          redirect_to refinery.leaders_admin_group_path(@group)
        end

      private

        def find_individuals
          @individuals = Refinery::Leaders::Individual.paginate(:page => params[:page])
        end

        def find_current_group
          @group = Refinery::Leaders::Group.find params[:id]
        end

        def check_current_user_role
          if !current_refinery_user.has_role?("Refinery")
            redirect_to refinery.leaders_admin_groups_path, :flash => { :notice => "can not find that group" }
          end
        end

        def check_before_destroy
          if !current_refinery_user.has_role?("Refinery")
            redirect_to refinery.groups_admin_groups_path, :flash => { :notice => "can not delete this group" }
          end
        end

        def check_before_edit
          if !current_refinery_user.has_role?("Refinery")
            redirect_to refinery.groups_admin_groups_path, :flash => { :notice => "can not edit this group" }
          end
        end

      end
    end
  end
end
