# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "Groups" do
    describe "Admin" do
      describe "groups" do
        refinery_login_with :refinery_user

        describe "groups list" do
          before(:each) do
            Refinery::Groups::Group.delete_all
            FactoryGirl.create(:group, :name => "UniqueTitleOne")
            FactoryGirl.create(:group, :name => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.groups_admin_groups_path
            page.should have_content("UniqueTitleOne")
            page.should have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before(:each) do
            Refinery::Groups::Group.delete_all
            visit refinery.groups_admin_groups_path

            click_link "Add New Group"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Name", :with => "This is a test of the first string field"
              click_button "Save"

              page.should have_content("'This is a test of the first string field' was successfully added.")
              Refinery::Groups::Group.count.should == 1
            end
          end

          context "invalid data" do
            it "should fail" do
              click_button "Save"

              page.should have_content("Name can't be blank")
              Refinery::Groups::Group.count.should == 0
            end
          end

          context "duplicate" do
            before(:each) { FactoryGirl.create(:group, :name => "UniqueTitle") }

            it "should fail" do
              visit refinery.groups_admin_groups_path

              click_link "Add New Group"

              fill_in "Name", :with => "UniqueTitle"
              click_button "Save"

              page.should have_content("There were problems")
              Refinery::Groups::Group.count.should == 1
            end
          end
        end

        describe "edit" do
          before(:each) do
            Refinery::Groups::Group.delete_all
            FactoryGirl.create(:group, :name => "A name")
          end

          it "should succeed" do
            visit refinery.groups_admin_groups_path

            within ".actions" do
              click_link "Edit this group"
            end

            fill_in "Name", :with => "A different name"
            click_button "Save"

            page.should have_content("'A different name' was successfully updated.")
            page.should have_no_content("A name")
          end
        end

        describe "destroy" do
          before(:each) do
            Refinery::Groups::Group.delete_all
            FactoryGirl.create(:group, :name => "UniqueTitleOne")
            create(:guest_group)
          end

          it "should succeed" do
            visit refinery.groups_admin_groups_path

            # click_link "Remove this group forever"
            find(".delete_group").click

            page.should have_content("'UniqueTitleOne' was successfully removed.")
            # only guest group
            Refinery::Groups::Group.count.should == 1
          end
        end

      end
    end
  end
end
