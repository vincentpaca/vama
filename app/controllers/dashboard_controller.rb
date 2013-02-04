class DashboardController < ApplicationController
  before_filter :authenticate_user!

  def index
    @reservations = current_user.reservations
    @purchases = current_user.purchases
  end
end
