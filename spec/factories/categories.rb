FactoryBot.define do
  factory :category do
    name { 'Category Name' }
    icon { 'category-icon.png' }
    association :user
  end
end
