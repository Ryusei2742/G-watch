FactoryBot.define do
  factory :review do
    user
    work
    status { "watched" }
    rating { 1 }
    comment { "MyText" }
  end
end
