# frozen_string_literal: true

require 'rails_helper'

feature 'admin actions' do
  given(:admin) { create(:admin) }

  scenario 'admin fill login form and get success' do
    visit 'admins/sign_in'
    within('#new_admin') do
      fill_in 'Email', with: admin.email
      fill_in 'Password', with: admin.password
    end
    click_button 'Log in'
    expect(page).to have_content('Signed in successfully.')
  end

  context 'when admin logged in' do
    given(:user) { create(:user) }
    given!(:event) { create(:event, user: user) }

    background do
      login_as(admin, scope: :admin)
      visit admin_events_path
    end

    scenario 'change edit form data and save' do
      click_link('Edit')
      fill_in 'Title', with: 'New event title'
      click_button 'Save'
    end

    scenario 'delete event' do
      click_link('Delete')
    end

    scenario 'logout account' do
      click_link 'Sign out'
    end
  end
end
