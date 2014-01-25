class DashboardController < ApplicationController
  def index
    @bets = Bet.all
  end
end
