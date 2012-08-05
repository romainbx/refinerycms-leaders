Refinery::User.class_eval do
  belongs_to :group, :class_name => "Refinery::Groups::Group"
  attr_accessible :group_id

  after_create :set_default_group

private

  def set_default_group
    unless group
      update_attributes!(:group_id => Refinery::Groups::Group.find_or_create_by_name("guest").id)
    end
  end

end