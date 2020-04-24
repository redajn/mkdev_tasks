# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Event, type: :model do
  describe 'validations' do
    it { should validate_presence_of :title }
    it { should validate_presence_of :description }
    it { should validate_presence_of :location }
    it { should validate_presence_of :start_time }
    it { should validate_presence_of :end_time }
    it { should validate_presence_of :organizer_email }
    it { should validate_presence_of :organizer_telegram }
    it { should validate_presence_of :link }
    it { should validate_length_of :title }
    it { should validate_length_of :description }
    it { should validate_length_of :organizer_telegram }

    context 'with valid attributes' do
      it { is_expected.to allow_values(Faker::Internet.email).for(:organizer_email) }
      it { is_expected.to allow_values(Faker::Internet.url).for(:link) }
    end

    context 'with invalid attributes' do
      it { is_expected.to_not allow_values('invalid_format').for(:organizer_email) }
      it { is_expected.to_not allow_values('invalid_format').for(:link) }
    end
  end

  describe 'get messege error' do
    it 'get error if start later then end' do
      subject.start_time = Time.current
      subject.end_time = Time.current - 1.day
      subject.valid?
      expect(subject.errors[:end_time]).to include('must be after the start date')
    end
  end

  it { should belong_to(:user) }
end
