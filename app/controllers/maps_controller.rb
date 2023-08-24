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
    # 自分の投稿のIDを取得
    my_post_ids = current_user.places.pluck(:id)

    # 公開アカウントのユーザーIDを取得
    public_user_ids = User.where(account_type: 'public_account').pluck(:id)

    # フォローリクエストが承認されたユーザーのIDを取得
    approved_followers_ids = current_user.following_relationships.where(status: 'approved').pluck(:followed_id)

    # 承認してくれた非公開アカウントの投稿のIDを取得
    approved_private_post_ids = Place.joins(:user).where(user_id: approved_followers_ids, users: { account_type: 'private_account' }).pluck(:id)

    # 自分の投稿と公開アカウントの投稿と承認してくれた非公開アカウントの投稿のIDを取得
    post_ids_to_show = my_post_ids + Place.where(user_id: public_user_ids).pluck(:id) + approved_private_post_ids

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