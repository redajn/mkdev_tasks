# frozen_string_literal: true

# Main app controller
class ApplicationController < ActionController::Base
  before_action :authenticate_user!, only: %i[new create edit update destroy]

  def after_sign_in_path_for(current_user)
    current_user.admin? ? admin_events_path : root_path
  end
end
