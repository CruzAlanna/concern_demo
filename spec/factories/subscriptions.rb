FactoryBot.define do
  factory :subscription do
    plan_name { "Sample Plan" }
    cancelled { false }
  end
end