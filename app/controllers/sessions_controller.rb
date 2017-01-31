class SessionsController < ApplicationController
  def create
    user = User.register(request.env["omniauth.auth"])
    if user.save
      session[:id] = user.id
      redirect_to dashboard_index_path
    else
      redirect_to root_path
    end
  end

  def destroy
    reset_session

    redirect_to root_path
  end

end
