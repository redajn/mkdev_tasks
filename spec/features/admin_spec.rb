# frozen_string_literal: true

require 'rails_helper'

feature 'admin actions' do
  given!(:admin) { create(:admin) }
  given!(:user) { create(:user) }

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
    given!(:event) { create(:event, :pending, user: user) }

    background do
      login_as(admin, scope: :admin)
      visit admin_events_path
    end

    scenario 'change data in the edit form, save and get success' do
      click_link('Edit')
      fill_in 'Title', with: 'New event title'
      click_button 'Save'
      expect(page).to have_content('Event has been updated!')
    end

    scenario 'removal event and get success' do
      click_link('Delete')
      page.driver.browser.switch_to.alert.accept
      expect(page).to have_content('Event has been removed!')
    end

    scenario 'logout account, get login link' do
      click_link 'Sign out'
      expect(page).to have_link('Sign_in')
    end

    scenario 'logout account, get registration link' do
      click_link 'Sign out'
      expect(page).to have_link('Registration')
    end

    context 'when event is pending' do
      given!(:pending_event) { create(:event, :pending, user: user) }
      background { visit admin_event_path(pending_event) }

      scenario 'approve event, get sucsess' do
        visit admin_event_path(pending_event)
        click_link 'approve'
        expect(page).to have_content('Event state set to: approved')
      end

      scenario 'reject event, get sucsess' do
        click_link 'reject'
        expect(page).to have_content('Event state set to: rejected')
      end
    end

    context 'when event is approved' do
      given!(:approved_event) { create(:event, :approved, user: user) }
      background { visit admin_event_path(approved_event) }

      scenario 'to pending event, get sucsess' do
        click_link 'pending'
        expect(page).to have_content('Event state set to: pending')
      end

      scenario 'reject event, get sucsess' do
        click_link 'reject'
        expect(page).to have_content('Event state set to: rejected')
      end
    end

    context 'when event is rejected' do
      given!(:rejected_event) { create(:event, :rejected, user: user) }
      background { visit admin_event_path(rejected_event) }

      scenario 'to pending event, get sucsess' do
        click_link 'pending'
        expect(page).to have_content('Event state set to: pending')
      end

      scenario 'approve event, get sucsess' do
        click_link 'approve'
        expect(page).to have_content('Event state set to: approved')
      end
    end
  end
end
