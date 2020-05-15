require 'mailgun-ruby'

class EventCreator < ApplicationService

  def initialize(event_params, current_user)
    @event_params = event_params
    @current_user = current_user
  end

  def call
    event = @current_user.events.new(@event_params)
    RestClient.post "https://api:#{Rails.application.credentials.mailer[:api_key]}"\
                    "@api.mailgun.net/v3/#{Rails.application.credentials.mailer[:domain]}/messages",
                    :from => "<mailgun@#{Rails.application.credentials.mailer[:domain]}>",
                    :to => "#{Admin.first.email}",
                    :subject => "Hello",
                    :text => "Testing some Mailgun awesomness!"
    event
  end
end
