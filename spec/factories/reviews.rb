FactoryBot.define do
  factory :review do
    user { nil }
    work { nil }
    status { "MyString" }
    rating { 1 }
    comment { "MyText" }
  end
end
