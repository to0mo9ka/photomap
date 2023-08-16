class PhotosController < ApplicationController
  def index
    @places = Place.all
  end
end
