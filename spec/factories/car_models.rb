FactoryBot.define do
  factory :car_model do
    name { 'Up!' }
    year { '2008' }
    manufacture
    car_options { '3 portas' }
  end
end
