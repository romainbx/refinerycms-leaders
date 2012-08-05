
FactoryGirl.define do
  factory :group, :class => Refinery::Groups::Group do
    sequence(:name) { |n| "refinery#{n}" }
  end

  factory :guest_group, :class => Refinery::Groups::Group do
    name "guest"
  end

end

