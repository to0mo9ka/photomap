class MapsController < ApplicationController
  def new
    @place = Place.new
    @places = Place.all
  end

  def create
    @place = Place.new(place_params)
    if @place.save
      flash[:notice] = 'Place was successfully created.'
      redirect_to maps_new_path
    else
      @places = Place.all
      render :new
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