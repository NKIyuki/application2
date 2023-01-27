class UsersController < ApplicationController
   before_action :authenticate_user!,except:[:top]
  before_action :correct_user, only: [:edit]

 def show
    @user = User.find(params[:id])
    @users = User.all
    @users = User.new
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

  def create
    @user = User.new(user_params)
    @user = current_user
    if @user.save
    redirect_to user_path
    else
      render :new
    end
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    flash[:notice] = "You have updated user successfully."
    redirect_to user_path(@user.id)
  end

  private

  def user_params
    params.require(:user).permit(:name,:introduction,:profile_image)
  end

  def correct_user
    @user = User.find(params[:id])

    redirect_to(user_path) unless @user == current_user
  end

end

