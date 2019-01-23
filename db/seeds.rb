array = ["FACE", "EYE TREATMENTS", "LIP", "CLEANSERS", "TREATMENT & SERUMS", "SUNCARE" "NAILS POLISH", "GEL", "SHAMPOO", "STREATMENT", "HAIR COLOR", "BATH & SHOWER"]

array.each do |cate|
  Category.create! name: "#{cate}"
end

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
20.times do |n|
  name  = FFaker::Name.name
  email = "nhung-#{n+1}@gmail.com"
  password = "password"
  dob = FFaker::Time.date
  address = FFaker::Address.city
  phone = FFaker::PhoneNumber.phone_number
  User.create!(username:  name,
               email: email,
               password: password,
               password_confirmation: password,
               dob: dob,
               address: address,
               phone: phone)
end
