class PostsController < ApplicationController

  def index
    @posts = Post.all

    @markers = @posts.geocoded.map do |post|
      {
        lat: post.latitude,
        lng: post.longitude
      }
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    if @post.save
      redirect_to post_path(@post)
    else
      render :new
    end
  end

  def my_posts

    @user_posts = current_user.posts
    @markers = @user_posts.geocoded.map do |post|
      {
        lat: post.latitude,
        lng: post.longitude
      }
    end
  end

  private

  def post_params
    params.require(:post).permit(:description, :latitude, :longitude, :photo, :address)
  end

end
