class AdminController < ApplicationController
  before_action :authenticate_user!
  before_action :admin?
  layout "admin"

  private

    def admin?
      redirect_to root_path unless current_user.hotel_admin?
    end
end