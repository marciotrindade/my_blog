FactoryGirl.define do

  sequence(:name)   { |n| "Name #{n}"}
  sequence(:login)  { |n| "login#{n}"}
  sequence(:email)  { |n| "email#{n}@example.com"}
  sequence(:number) { |n| n }

  factory :user do
    name
    email
    url                   'http://mysite.com'
    password              'secret'
    password_confirmation 'secret'
  end

  factory :role do
    name
  end

  factory :contact do
    name  "My name"
    email "test@test.com"
    body  "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
  end

  factory :post do
    name
    body        "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
    keywords    "my, new, test"
    page_body   "short description for this page"
    active      true
  end

  factory :category do
    name
    keywords    "my, new, test"
    page_title  "my page title"
    page_body   "short description for this category"
  end

  factory :page do
    name
    body        "my page content"
    keywords    "my, new, test"
    page_title  { next(:name) }
    page_body   "short description for this page"
  end

end
