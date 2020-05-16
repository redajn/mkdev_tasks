# frozen_string_literal: true

require 'mailgun-ruby'

# Create method service
class EventCreator < ApplicationService
  def initialize(event_params, current_user)
    @event_params = event_params
    @current_user = current_user
  end

  def call
    event = @current_user.events.new(@event_params)
    return unless event.save

    send_notice
    event
  end

  private

  def send_notice
    mg_client = Mailgun::Client.new
    mg_client.enable_test_mode! if Rails.env.test?

    message_params = { from:    "bob@sandbox616bec72527142fdb99f50493a72fb1f.mailgun.org",
                       to:      'vengoshara@gmail.com',
                       subject: 'The Ruby SDK is awesome!',
                       text:    'It is really easy to send a message!' }

    mg_client.send_message sandbox616bec72527142fdb99f50493a72fb1f.mailgun.org, message_params
  end
end
