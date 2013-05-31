# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| "email#{n}@example.com"}
    sequence(:name) {|n| "name#{n}"}
    sequence(:username) {|n| "username#{n}"}
    password "password"
    password_confirmation "password"

    # Child of :user factory, since it's in the `factory :user` block
    # factory :admin do
    #   admin true
    # end
  end
end
