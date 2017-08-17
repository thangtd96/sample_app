class SessionsController < ApplicationController

  def new; end

  def create
    user = User.find_by email: params[:sessions][:email].downcase

    if user && user.authenticate(params[:sessions][:password])
      log_in user
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
