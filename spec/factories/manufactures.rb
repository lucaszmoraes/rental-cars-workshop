FactoryBot.define do
  factory :manufacture do
    sequence(:name) { |n| "Volkswagen #{n}" }
  end
end
