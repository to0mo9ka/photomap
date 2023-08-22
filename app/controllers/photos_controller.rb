class PhotosController < ApplicationController
  def index
    @places = Place.all
    
  end
  
  #def show
    #@place = Place.find(params[:id])
  #end
  
  def destroy
  @place = Place.find(params[:id])
  @place.destroy
  redirect_to photos_index_path, notice: "場所情報を削除しました"
  end
end
