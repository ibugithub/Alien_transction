require 'rails_helper'

RSpec.feature 'Categories', type: :feature do
  let(:user) { create(:user) }

  before do
    sign_in user
  end

  scenario 'User sees a list of categories' do
    category1 = create(:category, user:, name: 'Category 1', icon: 'icon1.png')
    category2 = create(:category, user:, name: 'Category 2', icon: 'icon2.png')

    visit categories_path

    expect(page).to have_content('Categories')
    expect(page).to have_content('Category 1')
    expect(page).to have_content('Category 2')
    expect(page).to have_css("img[src*='icon1.png']")
    expect(page).to have_css("img[src*='icon2.png']")
    expect(page).to have_content(category1.updated_at.to_s)
    expect(page).to have_content(category2.updated_at.to_s)
  end

  scenario 'User sees a message when there are no categories' do
    visit categories_path

    expect(page).to have_content("You don't have any categories")
  end

  scenario 'User can navigate to the new category page' do
    visit categories_path

    click_link 'Create Category'

    expect(current_path).to eq(new_category_path)
  end
end
