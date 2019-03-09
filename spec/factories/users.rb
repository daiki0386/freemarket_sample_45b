FactoryBot.define do

  factory :user do
    nickname              { Faker::Internet.user_name(1..20)}
    email                 { Faker::Internet.email }
    password = Faker::Internet.password(8)
    password              { password }
    password_confirmation { password }
  end

end
