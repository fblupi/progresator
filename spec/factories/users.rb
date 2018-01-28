FactoryBot.define do
  factory :user do
    email 'john.doe@mail.com'
    password '123456'
    first_name 'John'
    last_name 'Doe'
    confirmed_at Date.today
  end
end
