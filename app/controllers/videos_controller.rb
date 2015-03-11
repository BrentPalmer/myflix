class VideosController < ApplicationController

  def index
    @categories = Category.includes(:videos)
  end

  def show
    @video = Video.find(params[:id])
  end
end