# frozen_string_literal: true

# Main app controller
class ApplicationController < ActionController::Base
  before_action :authenticate_user!, only: %i[new create edit update destroy]
end
