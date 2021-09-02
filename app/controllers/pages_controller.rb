class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @posts = Post.all

    @markers = @posts.geocoded.map do |post|
      {
        lat: post.latitude,
        lng: post.longitude
      }
    end
  end
end
