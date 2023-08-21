class MapsController < ApplicationController
  def new
    @place = Place.new
    @last_place = Place.last # 直前の投稿を取得
  end
  
  
  def create
    @place = current_user.places.build(place_params)
    if @place.save
      redirect_to photos_path, notice: 'Place was successfully created.'
    else
      render :new
    end
  end
  
  def index
    @places = Place.all
  end
  
  def destroy
    @place = Place.find(params[:id])
    if @place.destroy
      flash[:notice] = 'Place was successfully deleted.'
    else
      flash[:alert] = 'Failed to delete place.'
    end
    redirect_to maps_path
  end
  
  private

  def place_params
    params.require(:place).permit(:name, :latitude, :longitude, :image)
  end
end