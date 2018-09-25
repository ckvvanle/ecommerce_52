FactoryBot.define do
  factory :user do
    name {Faker::Name.name}
    email {Faker::Internet.email}
    password {"password"}
    password_confirmation {"password"}
    address {Faker::Address.full_address}
    phone {Faker::PhoneNumber.subscriber_number(10)}
    role {"member"}
  end

  factory :admin, parent: :user do
    role {"admin"}
  end
end
