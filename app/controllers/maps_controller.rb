class MapsController < ApplicationController
  def new
    @place = Place.new
    @last_place = Place.last # 直前の投稿を取得
  end
  
  
  def create
    @place = current_user.places.build(place_params)
    if @place.save
      redirect_to user_path(current_user), notice: 'Place was successfully created.'
    else
      render :new
    end
  end
  
  def index
    my_post_ids = current_user.places.pluck(:id)

    # 公開アカウントのユーザーIDを取得
    public_user_ids = User.where(account_type: 'public_account').pluck(:id)
    
    post_ids_to_show = my_post_ids + Place.where(user_id: public_user_ids).pluck(:id)

    # 上記の投稿IDを持つ投稿を取得
    @places = Place.where(id: post_ids_to_show).page(params[:page]).reverse_order
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
    params.require(:place).permit(:name, :body, :latitude, :longitude, :image)
  end
end