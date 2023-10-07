require 'rails_helper'

RSpec.feature 'Home Page', type: :feature do
  let(:user) { create(:user) }

  scenario 'User is not signed in' do
    visit root_path
    expect(page).to have_link('Sign Up', href: new_user_registration_path)
    expect(page).to have_link('Sign In', href: new_user_session_path)

    expect(page).not_to have_link('Start', href: categories_path)
    expect(page).not_to have_button('Logout')
  end

  scenario 'User is signed in' do
    sign_in user
    visit root_path
    expect(page).to have_link('Start', href: categories_path)
    expect(page).to have_button('Logout')

    expect(page).not_to have_link('Sign Up', href: new_user_registration_path)
    expect(page).not_to have_link('Sign In', href: new_user_session_path)
  end
end
