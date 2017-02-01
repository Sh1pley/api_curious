class HomeController < ApplicationController
  def index
    if current_user
      @user = User.get_details(current_user.login)
    end
  end
end
