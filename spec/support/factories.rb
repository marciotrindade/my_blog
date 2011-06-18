Factory.sequence :name do |n|
  "Name number #{n}"
end

Factory.sequence :login do |n|
  "user#{n}"
end

Factory.sequence :email do |n|
  "user#{n}@example.com"
end

Factory.sequence :number do |n|
  n
end

Factory.define :user do |f|
  f.username  { Factory.next(:login) }
  f.email     { Factory.next(:email) }
  f.name      { Factory.next(:name) }
  f.password  'secret'
  f.password_confirmation 'secret'
end

Factory.define :role do |f|
  f.name { Factory.next(:name) }
end

Factory.define :activity do |f|
  f.name { Factory.next(:name) }
end

Factory.define :doll do |f|
  f.name { Factory.next(:name) }
  f.born { Date.today }
end

Factory.define :place do |f|
  f.name { Factory.next(:name) }
end

Factory.define :public do |f|
  f.name { Factory.next(:name) }
end

Factory.define :sign do |f|
  f.name { Factory.next(:name) }
end

Factory.define :city do |f|
  f.name { Factory.next(:name) }
end

Factory.define :contact do |f|
  f.name  "My Name is"
  f.email "myemail@test.com"
  f.phone "(11) 6610-0055"
  f.body  "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
end

Factory.define :advertise do |f|
  f.name  "My Name is"
  f.email "myemail@test.com"
  f.phone "(11) 6610-0055"
  f.city  "Sao paulo"
  f.state "SP"
  f.body  "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
end
