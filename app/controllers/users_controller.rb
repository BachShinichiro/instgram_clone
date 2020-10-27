class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :check_user, only: [:show, :edit, :update, :destroy]
  def index
    @user = User.all
  end
  def new
    @user = User.new
  end
  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user.id)
    else
      render :new
    end
  end
  def show
    @user = User.find(params[:id])
  end
  def edit
  end
  def update
     if @user.update(user_params)
       redirect_to @user, notice: "プロフィールを編集しました！"
     else
       render :edit
     end
  end
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'アカウントを削除しました.' }
      format.json { head :no_content }
    end
  end
  def favorites
    @user = User.find(params[:id])
    @favorites = Favorite.where(user_id: @user.id)
  end
  private
  def set_user
    @user = User.find(params[:id])
  end
  def user_params
    params.require(:user).permit(:name, :email, :password, :content, :image,
                                 :password_confirmation)
  end
  def check_user
    if current_user != @user
      flash[:notice] = '他のユーザーは見れません'
      redirect_to pictures_path 
    end
  end
end
