# frozen_string_literal: true

require 'rails_helper'

feature 'user action' do
  given(:user) { create(:user) }

  scenario 'user fill login form and get success' do
    visit 'users/sign_in'
    within('#new_user') do
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
    end
    click_button 'Log in'
    expect(page).to have_content('Signed in successfully.')
  end

  context 'when user logged in' do
    given!(:event) { create(:event, :approved, user: user) }

    background do
      login_as(user, scope: :user)
      visit events_path
    end

    scenario 'create new event' do
      click_link('New')
      fill_in 'Title', with: Faker::ProgrammingLanguage.name[0..29]
      fill_in 'Description', with: Faker::TvShows::GameOfThrones.quote
      fill_in 'Location', with: Faker::Games::ElderScrolls.city
      within('.event_start_time') do
        select(DateTime.now.year, from: 'event_start_time_1i')
        select('March', from: 'event_start_time_2i')
        select('21', from: 'event_start_time_3i')
        select('00', from: 'event_start_time_4i')
        select('00', from: 'event_start_time_5i')
      end
      within('.event_end_time') do
        select(
          Faker::Time.between(from: DateTime.now, to: '2025-12-31 12:30:59 -0700').year,
          from: 'event_end_time_1i'
        )
        select('March', from: 'event_end_time_2i')
        select('21', from: 'event_end_time_3i')
        select('00', from: 'event_end_time_4i')
        select('00', from: 'event_end_time_5i')
      end
      fill_in 'Organizer email', with: Faker::Internet.email
      fill_in 'Organizer telegram', with: "@#{Faker::Internet.username}"
      fill_in 'Link', with: Faker::Internet.url
      click_button('Save')
      expect(page).to have_content('New event has been added!')
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
  end
end
