class PhotosController < ApplicationController
  def index
    my_post_ids = current_user.places.pluck(:id)

    # 公開アカウントのユーザーIDを取得
    public_user_ids = User.where(account_type: 'public_account').pluck(:id)
    
    post_ids_to_show = my_post_ids + Place.where(user_id: public_user_ids).pluck(:id)

    # 上記の投稿IDを持つ投稿を取得
    @places = Place.where(id: post_ids_to_show).page(params[:page]).reverse_order
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
