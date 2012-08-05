module Refinery
  module Leaders
    module Admin
      class GroupsController < ::Refinery::AdminController

        crudify :'refinery/groups/group', :title_attribute => 'name', :xhr_paging => true
        before_filter :find_current_group, :only => [:show, :edit]
        before_filter :check_current_user_role, :only => [:show, :edit, :destroy]
        before_filter :check_before_destroy, :only => :destroy
        before_filter :check_before_edit, :only => :edit

        def index
          if current_refinery_user.has_role?("Refinery")
            @groups = Refinery::Leaders::Group.paginate(:page => params[:page])
          elsif current_refinery_user.has_role?("GroupAdmin")
            @groups = Refinery::Leaders::Group.where(:name => current_refinery_user.group.name).paginate(:page => params[:page])
          end
        end

        def show
          @persons = @group.persons.paginate(:page => params[:page])
        end
        
        def edit
          @persons = @group.persons.paginate(:page => params[:page])
        end

        def add_persons
          @group = Group.find(params[:id])
          @persons = Refinery::Leaders::Person.where(:id => params[:user_ids])
          @group.persons = @group.persons + @persons.to_a
          @group.save
          redirect_to refinery.leaders_admin_group_path(@group)
        end

      private
        def find_current_group
          @group = Refinery::Leaders::Group.find params[:id]
        end
      end
    end
  end
end
