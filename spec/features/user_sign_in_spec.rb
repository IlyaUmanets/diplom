require 'rails_helper'

feature 'User sign in' do
  let(:user) { create(:user) }

  scenario 'User sign in' do
    visit new_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign in'

    expect(page).to have_content('Hello user')
  end
end
