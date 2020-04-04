FactoryBot.define do
  factory :account do
    name { "first" }
    addr1 { "12 High Street" }
    addr2 { "Westminster" }
    city { "London" }
    state { "" }
    zip { "MyString" }
    country { "UK" }
    settings { "" }
  end
end
