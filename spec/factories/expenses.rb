FactoryBot.define do
  factory :expense do
    name { 'Expense Name' }
    amount { 100.0 }
    association :user
    association :category
  end
end
