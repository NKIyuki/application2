class UsersController < ApplicationController
   before_action :authenticate_user!,except:[:top]
  before_action :correct_user, only: [:edit]
  def show
    @user = User.find(params[:id])
    @books = @user.books
  end

  def edit
    @user = User.find(params[:id])


  end

  def index
    @users = User.all
    @user = current_user
  end

  def new
    @user = User.new
  end


  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name,:introduction,:profile_image)
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to(user_path(current_user.id)) unless @user == current_user
  end

end
