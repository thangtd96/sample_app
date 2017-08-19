class SessionsController < ApplicationController

  def new; end

  def create
    user = User.find_by email: params[:sessions][:email].downcase
    if user && user.authenticate(params[:sessions][:password])
      if user.activated?
        log_in user
        params[:sessions][:remember_me] == "1" ? remember(user) : forget(user)
        redirect_back_or user
      else
        message = t ".mailler.activated"
        message += t ".mailler.activated_1"
        flash[:warning] = message
        redirect_to root_url
      end
    else
      render :new
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_path
  end
end
