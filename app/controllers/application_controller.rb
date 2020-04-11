# frozen_string_literal: true

# Main app controller
class ApplicationController < ActionController::Base
  def after_sign_in_path_for(current_user)
    current_admin ? admin_events_path : root_path
  end
end
