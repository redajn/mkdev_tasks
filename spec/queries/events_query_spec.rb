# frozen_string_literal: true

require 'rails_helper'

RSpec.describe EventsQuery do
  let(:approved_event) { create(:event, :approved) }
  let(:rejected_event) { create(:event, :rejected) }
  let(:pending_event) { create(:event, :pending) }

  describe 'require by state' do
    include_examples 'query events by state', :approved
    include_examples 'query events by state', :rejected
    include_examples 'query events by state', :pending
  end
end
