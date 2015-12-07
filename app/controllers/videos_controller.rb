class VideosController < ApplicationController

  respond_to :json

  def index

    @videos = Video.all

    respond_to do |format|
      format.json { render json: @videos }
      format.html
    end

  end

  def show

  end

end