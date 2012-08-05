module Refinery
  module Leaders
    module Admin
      class PersonsController < ::Refinery::AdminController
        crudify :'refinery/leaders/person',
              :order => 'name ASC',
              :title_attribute => 'name',
              :xhr_paging => true

        before_filter :find_group
        before_filter :find_all_guest_users, :only => :new

        def index
          @persons = Refinery::Leaders::Group.find(params[:group_id]).persons.paginate(:page => params[:page])
        end

        def create
          @person = Refinery::Leaders::Person.new(params[:person])

          if @person.save
            redirect_to refinery.leaders_admin_group_path(@person.group), :notice => t('created', :what => @person.name, :scope => 'refinery.crudify')
          else
            @group = Refinery::Leaders::Group.find(params[:person][:group_id])
            render :action => 'new'
          end
        end

        def update
          person = Refinery::Leaders::Person.find params[:id]
          person.update_attributes!(params[:person])
          redirect_to refinery.leaders_admin_group_path(@group)
        end

        def destroy
          person = Refinery::User.find params[:id]
          person.delete
          redirect_to refinery.leaders_admin_group_path(@group)
        end

      private

        def find_group
          if request["action"] == "create"
            @group = Refinery::Leaders::Group.find(params[:person][:group_id])
          else
            @group = Refinery::Leaders::Group.find(params[:group_id])
          end
        end
        
      end
    end
  end
end
