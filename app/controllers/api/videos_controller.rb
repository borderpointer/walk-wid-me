class Api::VideosController < ApplicationController

  def index

    @videos = Video.all

    respond_to do |format|
      format.json { render json: @videos }
    end

  end

end