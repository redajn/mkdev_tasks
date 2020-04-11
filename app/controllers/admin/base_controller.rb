# frozen_string_literal: true

class Admin
  # Base controller for admin namespace
  class BaseController < ApplicationController
    layout "admin"

    before_action :authenticate_admin!
  end
end
