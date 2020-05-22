# frozen_string_literal: true

require 'mailgun-ruby'

# Create method service
class CreateEvent < ApplicationService

  def initialize(event_params, current_user, url)
    @url = url
    @event_params = event_params
    @current_user = current_user
  end

  def call
    event = @current_user.events.new(@event_params)
    return unless event.save

    send_notice(event)
    event
  end

  private

  def send_notice(event)
    SendNewEventNotice.run(event, @url)
  end
end
