class UsersController < ApplicationController
  before_action :find_params, only: %i[show edit update destroy]
  before_action :logged_in_user, only: %i[edit update]
  before_action :correct_user, only: %i[edit update]
  before_action :admin_user, only: :destroy

  def index
    @users = User.select(:id, :name, :email)
                 .order(:name).paginate(page: params[:page], per_page: Settings.paginate)
  end

  def new
    @user = User.new
  end

  def show; end

  def create
    @user = User.new user_params

    if @user.save
      flash[:danger] =  t "flash.create"
      redirect_to @user
    else
      flash.now[:danger] =  t "flash.not_create"
      render :new
    end
  end

  def edit; end

  def update
    if @user.update_attributes user_params
      flash[:success] =  t "flash.update"
      redirect_to @user
    else
      flash.now[:danger] =  t "flash.not_update"
      render :edit
    end
  end

  def destroy
    if @user.destroy
      flash.now[:success] =  t "flash.deleted"
      redirect_to users_url
    else
      flash.now[:success] =  t "flash.not_delete"
    end
  end

  private

  def user_params
    params.require(:user).permit :name, :email, :password,
                                 :password_confirmation
  end

  def find_params
    @user = User.find_by id: params[:id]
    return if @user
    flash[:danger] = t "flash.danger"
    redirect_to root_url
  end

  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] =  t "flash.login"
      redirect_to login_url
    end
  end

  def correct_user
    @user = User.find params[:id]
    redirect_to(root_url) unless current_user? @user
  end

  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end
end
