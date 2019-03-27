array = ["SNEAKER", "MAN", "WOMEN", "KIDS"]

array.each do |cate|
  Category.create! name: "#{cate}"
end

name = "No Name"
email = "admin@gmail.com"
password = "111111"
dob = "2000-01-01"
address = "Ha Noi"
phone = "0123456789"
role = 1
User.create(name: name, email: email, password: password, dob: dob, address: address, phone: phone, role: role)


20.times do |n|
  name = "Tai khoan #{n+1}"
  email = "tk#{n+1}@gmail.com"
  password = "111111"
  User.create!(name: name, email: email, password: password)
end
