class HomeController < ApplicationController
  before_action :validate_session

  def index
  end

  private

  def validate_session
    return unless current_user

    redirect_to orders_path
  end
end
