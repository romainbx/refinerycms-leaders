require 'spec_helper'

describe "groups management" do
  refinery_login_with :refinery_user

  let(:group){ create(:group, :name => "secondbureau") }
  let(:group2){ create(:group, :name => "2buro") }
  let(:group_admin){ create(:group_admin) }
  let(:refinery_user){ create(:refinery_user) }

  before(:each) do
    create(:group_admin)
  end

  describe "GET 'index'" do
    before(:each) do
      visit refinery.groups_admin_groups_path
    end

    it "should have add new link and re-order link" do
      page.should have_selector("a#add_group")
      page.should have_selector("a#reorder_action")
      page.should have_selector("a#reorder_action_done")
      page.should_not have_selector("a.delete_group")
      page.should_not have_selector("a.edit_group")
    end

    it "should have 2 groups in the index list" do
      create(:group)
      visit refinery.groups_admin_groups_path
      # it should be 2, because we have created refinery_user by 
      # 'refinery_login_with :refinery_user'
      # by default it's group is 'guest'
      page.should have_selector("a.show_group", :count => 2)
    end

    it "should search something" do
      fill_in 'search', :with => 'guest'
      find("input[type=submit]").click
      page.should have_content("guest")
    end

  end

  describe "group show" do
    before(:each) do
      visit refinery.groups_admin_group_path(group)
    end

    it "should add the first user with a role group admin and placed at the top" do
      group.users.count.should == 0
      group.add_user refinery_user
      visit refinery.groups_admin_group_path(group)
      page.should have_selector("span.group_admin")
    end

    it "should have the information of the the group" do
      page.should have_content(group.name)
      page.should have_selector("span#group_users_count")
      pending "think about one admin or many admin in a group"
    end

    it "should have 3 action links" do
      page.should have_selector("a#edit_group")
      page.should have_selector("a#delete_group")
      page.should have_selector("a#add_user")
    end

    it "should go to new group user page" do
      find("a#add_user").click
      current_path.should == refinery.new_groups_admin_group_user_path(group)
    end

    it "should go to edit group path" do
      find("a#edit_group").click
      current_path.should == refinery.edit_groups_admin_group_path(group)
    end

    it "should delete the group successfully" do
      find("a#delete_group").click
      current_path.should == refinery.groups_admin_groups_path
      page.should have_selector("a.show_group", :count => 1)
    end

  end

  describe "groups users management" do

    it "should show all users in this group" do
      visit refinery.groups_admin_group_users_path group
      page.should have_selector("#records")
    end

  end

end
