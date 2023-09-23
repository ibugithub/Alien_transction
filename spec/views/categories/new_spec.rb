require 'rails_helper'

RSpec.feature 'Category Creation', type: :feature do
  let(:user) { create(:user) }

  before do
    sign_in user
  end

  scenario 'User creates a new category' do
    visit new_category_path

    fill_in 'Name', with: 'New Category Name'
    click_button 'Create Category'

    expect(page).to have_content('Category was successfully created.')
    expect(page).to have_content('New Category Name')
  end

  scenario 'User sees errors when creating a category with invalid data' do
    visit new_category_path

    click_button 'Create Category'

    expect(page).to have_content('prohibited this category from being saved')
    expect(page).to have_content("Name can't be blank")
  end
end
