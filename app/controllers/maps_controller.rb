class MapsController < ApplicationController
  def new
    @place = Place.new
    @places = Place.all
  end

  def create
    @place = Place.new(place_params)
    if @place.save
      

      flash[:notice] = 'Place was successfully created.'
      # 新しい投稿の緯度と経度情報を取得
      @new_latitude = params[:place][:latitude].to_f
      @new_longitude = params[:place][:longitude].to_f

      redirect_to new_map_path
    end
  end

  def index
  end

  def destroy
    @place = Place.find(params[:id])
    if @place.destroy
      flash[:notice] = 'Place was successfully deleted.'
    else
      flash[:alert] = 'Failed to delete place.'
    end
    redirect_to maps_new_path
  end

  private

  def place_params
    params.require(:place).permit(:name, :latitude, :longitude, :image)
  end
end
