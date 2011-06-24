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

Factory.define :contact do |f|
  f.name  "My name"
  f.email "test@test.com"
  f.body  "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
end

Factory.define :post do |f|
  f.name { Factory.next(:name) }
  f.body "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
  f.keywords "my, new, test"
  f.page_title { Factory.next(:name) }
  f.page_body "short description for this page"
end

Factory.define :category do |f|
  f.name { Factory.next(:name) }
  f.keywords "my, new, test"
  f.page_title "my page title"
  f.page_body "short description for this category"
end

Factory.define :comment do |f|
  f.name  { Factory.next(:name) }
  f.email { Factory.next(:email) }
  f.post  { Factory(:post) }
  f.url   "http://marciotrindade.com"
  f.body  "My message is here."
end
