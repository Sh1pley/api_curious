class SessionsController < ApplicationController
  def create
    if user = User.register(request.env["omniauth.auth"])
      session[:user_id] = user.id
    end
      redirect_to root_path
  end

  def destroy
    reset_session

    redirect_to root_path
  end

end
