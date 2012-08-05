require 'spec_helper'

describe "users in a group" do
  
  it "should have a default group" do
    user = create(:refinery_user)
    user.group.name.should == "guest"
  end

end