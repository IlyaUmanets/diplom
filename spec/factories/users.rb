FactoryGirl.define do
  factory :user do
    email Faker::Internet.email
    password '11223344'
    password_confirmation '11223344'
  end
end
