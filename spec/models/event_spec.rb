# frozen_string_literal: true

require "rails_helper"

RSpec.describe Event, type: :model do
  describe "validations" do
    it { should validate_presence_of :title }
    it { should validate_presence_of :description }
    it { should validate_presence_of :location }
    it { should validate_presence_of :start_time }
    it { should validate_presence_of :end_time }
    it { should validate_presence_of :organizer_email }
    it { should validate_presence_of :organizer_telegram }
    it { should validate_presence_of :link }
  end
end
