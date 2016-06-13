require 'rails_helper'

feature 'Admin sign in' do
  let(:admin) { create(:user, role: :admin, state: :approved) }

  scenario 'Admin sign in' do
    visit new_admin_session_path

    fill_in 'Email', with: admin.email
    fill_in 'Password', with: admin.password
    click_button 'Sign in'

    expect(page).to have_content('Dashboard')
  end
end
