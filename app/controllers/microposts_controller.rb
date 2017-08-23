class MicropostsController < ApplicationController
  before_action :logged_in?, only: %i(create destroy)
  before_action :correct_user, only: :destroy

  def create
    @micropost = current_user.microposts.build micropost_params

    if @micropost.save
      flash[:success] = t "post.flash_success"
    else
      flash[:danger] = erros_create @micropost
    end

    redirect_to root_url
  end

  def destroy
    if @micropost.destroy
      flash[:danger] = t "post.flash_success_1"
      redirect_to request.referrer || root_url
    else
      flash.now[:danger] = t "flash.not_delete"
    end
  end


  private

  def micropost_params
    params.require(:micropost).permit :content, :picture
  end

  def correct_user
    @micropost = current_user.microposts.find_by id: params[:id]
    redirect_to root_url if @micropost.nil?
  end
end
