FactoryBot.define do
  factory :user do
    email { FFaker::Internet.email }
    password { 'factorybotuser' }
    password_confirmation { 'factorybotuser' }
  end
end
