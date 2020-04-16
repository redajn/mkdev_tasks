# frozen_string_literal: true

require "rails_helper"

describe "admin access" do
  let(:admin) { create(:admin) }

  context "when admin is logged in" do
    before do
      login_as(admin, scope: :admin)
      visit admin_events_path
    end

    it "logout link is present" do
      expect(page).to have_link("Sign out")
    end
  end
end
