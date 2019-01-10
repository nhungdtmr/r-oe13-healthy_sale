Category.create! name: "Skincare"

Category.create! name: "Tonner"

Supplier.create!(name: "The face shop",
                 address: "Korea",
                 phone: "1234567890")

Supplier.create!(name: "Oganic",
                 address: "VietNam",
                 phone: "0245413434")

User.create!(username: "Nhung",
             email: "admin1@gmail.com",
             password: "111111",
             password_confirmation: "111111",
             dob: "2000-01-08",
             address: "hanoi",
             phone: "0123456789",
             role: 1)
99.times do |n|
  name  = FFaker::Name.name
  email = "nhung-#{n+1}@gmail.com"
  password = "password"
  User.create!(username:  name,
               email: email,
               password: password,
               password_confirmation: password,
               dob: "2000-01-08",
               address: address,
               phone: phone)
end
