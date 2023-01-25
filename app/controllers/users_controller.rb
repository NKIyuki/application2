class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])


  end

  def index
    @users = User.all
    @user = current_user
  end

  def new
    @post_images = Post_images.new
  end

  def create
    @post_image = PostImage.new(post_image_params)
    @post_image.user_id = current_user.id
    @post_image.save
    redirect_to post_images_path
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

end
