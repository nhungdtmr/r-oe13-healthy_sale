FactoryBot.define do
  factory :user do
    username {FFaker::Name.name}
    email {FFaker::Internet.email}
    password {"111111"}
    dob {FFaker::Time.date}
    address {FFaker::Address.city}
    phone {FFaker::PhoneNumber.phone_number}
  end
end
