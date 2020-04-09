# frozen_string_literal: true

class Admin::BaseController < ApplicationController

  before_action :authenticate_user!
  before_action :check_admin

  private

  def check_admin
    redirect_to root_path, alert: "You have not permissions" unless current_user.admin?
  end
end
