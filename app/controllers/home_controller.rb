class HomeController < ApplicationController
  def index
    if current_user
      @presenter = DashboardPresenter.new(current_user)
    end
  end
end
