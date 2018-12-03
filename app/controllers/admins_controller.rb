class AdminsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_admin

  private

  def check_admin
    redirect_to root_path unless current_user.has_role? :admin
  end
end
