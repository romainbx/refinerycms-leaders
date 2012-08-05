
FactoryGirl.define do
  factory :role, :class => Refinery::Role do
    sequence(:title) { |n| "refinery#{n}" }
  end

  factory :group_admin, :class => Refinery::Role do
    title "GroupAdmin"
  end
end