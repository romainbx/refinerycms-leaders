require 'spec_helper'

module Refinery
  module Groups
    describe Group do

      context "validations => " do
        subject do
          Refinery::Groups::Group.delete_all
          create(:group, :name => "secondbureau")
        end

        it { should be_valid }
        its(:errors) { should be_empty }
        its(:name) { should == "secondbureau" }
      end

      context "[MANAGEMENT]" do
        
        before(:each) do
          @group = create(:group, :name => "secondbureau")

          @user1 = create(:user)
          @user2 = create(:user)

          @group_admin_role = create(:group_admin)
        end

        it "should add users successfully" do
          @group.users.count.should == 0
          @group.add_user @user1
          @group.add_user @user2
          @group.users.count.should == 2
        end

        it "should not add duplicate users" do
          @group.users.count.should == 0
          @group.add_user @user1
          @group.add_user @user1
          @group.users.count.should == 1
        end

        it "the first user added to a group will turn its role to be 'group-admin'" do
          @group.users.count.should == 0
          @group.add_user @user1
          @user1.roles.should include(@group_admin_role)
        end

        it "should remove an user successfully" do
          @group.users.count.should == 0
          @group.add_user @user1
          @group.users.count.should == 1
          @group.remove_user @user1
          @group.users.count.should == 0
        end

        it "should not have the GroupAdmin role after the user is removed from a group" do
          @group.users.count.should == 0
          @group.add_user @user1
          @user1.roles.should include(@group_admin_role)
          @group.remove_user @user1
          @group.users.count.should == 0
          @user1.roles.should_not include(@group_admin_role)
        end

        it "should put all user into guest group after the current group is deleted" do
          @group.users.count.should == 0
          @group.add_user @user1
          @group.users.count.should == 1
          @group.destroy
          @user1.group.name.should == "guest"
        end

        it "should not be able to destroy the only guest group" do
          pending "it is under working here"
        end

      end

    end
  end
end
