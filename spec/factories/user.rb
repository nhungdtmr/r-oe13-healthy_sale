FactoryBot.define do
  factory :user do
    name {FFaker::Name.name}
    email {FFaker::Internet.email}
    dob {FFaker::Time.date}
    address {FFaker::Address.city}
    phone {FFaker::PhoneNumber.phone_number}
  end
end
