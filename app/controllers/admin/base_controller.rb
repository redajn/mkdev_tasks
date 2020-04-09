# frozen_string_literal: true

module Admin
  # Base controller for admin namespace
  class BaseController < ApplicationController
    before_action :authenticate_user!
    before_action :check_admin

    private

    def check_admin
      redirect_to root_path, alert: "You have not permissions" unless current_user.admin?
    end
  end
end
