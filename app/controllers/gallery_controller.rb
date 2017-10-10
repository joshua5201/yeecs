class GalleryController < ApplicationController
  def index
    @albums = Album.all.order(rank: :asc).page(params[:page]).per(5)
  end
end
