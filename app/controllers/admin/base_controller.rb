# frozen_string_literal: true


# Base controller for admin namespace
class Admin::BaseController < ApplicationController
  layout "admin"

  before_action :authenticate_admin!
  before_action :check_admin

  private

  def check_admin
    redirect_to root_path, alert: "You have not permissions" unless current_admin
  end
end

