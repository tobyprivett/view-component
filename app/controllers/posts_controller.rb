class PostsController < ApplicationController
  def index
    @posts = WordPress::V2::Post.all
  end

  def show
    @post = WordPress::V2::Post.find(params[:id])
  end
end
