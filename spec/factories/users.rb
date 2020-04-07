FactoryBot.define do
  factory :user do
    name { "MyString" }
    email { Faker::Internet.email }
    password { "password" }

    factory :admin do
      after(:create) { |user| user.add_role(:admin) }
    end

    factory :admin_account, parent: :admin do
      association :account, factory: :account, strategy: :build

      transient do
        users_count { 3 }
      end

      factory :admin_account_with_users do
        after(:create) do |admin, evaluator|
          create_list(:user, evaluator.users_count, account: admin.account)
        end
      end
    end
  end
end
