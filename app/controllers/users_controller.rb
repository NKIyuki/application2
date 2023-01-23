class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def edit

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
    @user = @User.faind(params[:id])
    user.update(user_params)
    redirect_to user_path(user.id)
  end

  private

  def post_image_params
    params.require(:post_image).permit(:shop_name, :image, :caption)
  end

end
