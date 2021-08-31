class PostsController < ApplicationController

  def index
    @post = Post.all
  end

  def show
    @post = post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new
  end
end
