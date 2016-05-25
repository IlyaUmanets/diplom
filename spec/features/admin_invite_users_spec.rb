require 'rails_helper'

feature 'Admin invite users' do
  let(:admin) { create(:user, role: :admin, state: :approved) }
  let(:email) { Faker::Internet.email }

  before do
    allow_any_instance_of(ApplicationController).to receive(:current_admin).and_return(admin)
  end

  scenario 'Admin invite user' do
    visit admin_dashboards_path
    click_link 'Invite someone'

    fill_in 'Email', with: email
    click_button 'Send invite'

    open_email(email)
    expect(current_email).to have_content(email)
  end
end
