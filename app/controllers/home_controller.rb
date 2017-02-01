class HomeController < ApplicationController
  def index
    if current_user
      @user = UserDetail.get_details(current_user.login)
    end
  end
end
