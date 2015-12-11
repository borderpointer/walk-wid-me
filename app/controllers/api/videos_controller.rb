class Api::VideosController < ApplicationController

  def index

    @videos = Video.all
    render json: @videos

    # respond_to do |format|
      # format.json {  }
    # end

  end

end