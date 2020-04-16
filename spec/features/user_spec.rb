# frozen_string_literal: true

require "rails_helper"

describe "user access" do
  let(:user) { create(:user) }

  context "when user is logged in" do
    before { login_as(user, scope: :user) }

    it "logout link is present" do
      visit root_path
      expect(page).to have_link("Sign out")
    end

    context "when click to 'new'" do
      it "new event form" do
        visit root_path
        click_link("New")
        expect(page).to have_xpath(".//form[@id='new_event']")
      end
    end

    context "when go to admin space" do
      it "login form for admin render" do
        visit admin_events_path
        expect(page).to have_xpath(".//form[@id='new_admin']")
      end
    end
  end

  context "when user is not logged in" do
    it "login link on the page" do
      visit root_path
      expect(page).to have_link("Sign_in")
    end

    it "registration link on the page" do
      visit root_path
      expect(page).to have_xpath(".//a[@href='/users/sign_up']")
    end

    context "when click 'new'" do
      before do
        visit root_path
        click_link("New")
      end

      it "new event form rendered" do
        expect(page).to have_xpath(".//form[@id='new_user']")
      end

      it "login form rendered" do
        expect(page).to_not have_xpath(".//form[@id='new_event']")
      end
    end
  end
end
