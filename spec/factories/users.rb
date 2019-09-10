FactoryBot.define do
  factory :user do
    email { 'teste@teste.com' }
    password { '12345678' }
    subsidiary
    role { :employee }

    trait :manager do
      role { :manager }
    end

    trait :admin do
      role { :admin }
    end
  end
end
