require 'rails_helper'

RSpec.feature 'Category Show', type: :feature do
  let(:user) { create(:user) }
  let(:category) { create(:category, user:) }

  before do
    sign_in user
    category = create(:category, user:)
    category.expenses.create(name: 'Expense 1', amount: 100.0)
    category.expenses.create(name: 'Expense 2', amount: 75.0)
  end

  scenario "User views a category's details" do
    visit category_path(category)

    expect(page).to have_content(category.name)
    expect(page).to have_css("img[src*='#{category.icon}']")

    category.expenses.each do |expense|
      expect(page).to have_content(expense.name)
      expect(page).to have_content(expense.amount)
    end
  end

  scenario 'User can navigate to create a new expense' do
    visit category_path(category)

    click_link 'Create Expense'

    expect(current_path).to eq(new_category_expense_path(category))
  end
end
