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

  describe 'states switchers' do
    let(:event) { create(:event) }

    it 'new event state is pendind' do
      expect(event).to have_state(:pending).on(:state)
    end

    it 'approve switch pending to approved' do
      expect(event).to transition_from(:pending).to(:approved).on_event(:approve).on(:state)
    end

    it 'approve switch rejected to approved' do
      expect(event).to transition_from(:rejected).to(:approved).on_event(:approve).on(:state)
    end

    it 'reject switch pending to rejected' do
      expect(event).to transition_from(:pending).to(:rejected).on_event(:reject).on(:state)
    end

    it 'reject switch approve to rejected' do
      expect(event).to transition_from(:approved).to(:rejected).on_event(:reject).on(:state)
    end

    it 'to_pending switch rejected to pending' do
      expect(event).to transition_from(:rejected).to(:pending).on_event(:to_pending).on(:state)
    end

    it 'to_pending switch approved to pending' do
      expect(event).to transition_from(:approved).to(:pending).on_event(:to_pending).on(:state)
    end
  end
end
