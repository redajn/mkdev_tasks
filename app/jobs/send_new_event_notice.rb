# frozen_string_literal: true

# Send event notice service
class SendNewEventNotice < Que::Job
  def run(event, url)
    mg_client = Mailgun::Client.new
    mg_client.enable_test_mode! if Rails.env.test?

    html_output = ActionController::Base.new

    html = html_output.render_to_string 'layouts/event_notify', locals: { event: event, url: url }

    message_params = { from:    'bob@sandbox616bec72527142fdb99f50493a72fb1f.mailgun.org',
                       to:      'vengoshara@gmail.com',
                       subject: 'New events waiting moderation',
                       html:    html.to_s }

    mg_client.send_message 'sandbox616bec72527142fdb99f50493a72fb1f.mailgun.org', message_params
  end
end
