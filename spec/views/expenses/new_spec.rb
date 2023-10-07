require 'rails_helper'

RSpec.feature 'Expense Form', type: :feature do
  let(:user) { create(:user) }
  let(:category) { create(:category, user:) }

  before do
    sign_in user
  end

  scenario 'User creates a new expense' do
    visit new_category_expense_path(category)
    select category.name, from: 'Selected Category'
    fill_in 'Name', with: 'Expense Name'
    fill_in 'Amount', with: 100.0
    click_button 'Create Expense'
    expect(page).to have_content('Expense was successfully created.')

    expect(page).to have_content('Expense Name')
    expect(page).to have_content('100.0')
  end
end
