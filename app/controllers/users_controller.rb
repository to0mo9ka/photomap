class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    # アクセス権限のチェック
    if @user != current_user && @user.account_type != 'public_account'
      redirect_to users_path, alert: "Access denied."
      return
    end
    @places = @user.places
  end
  
  def index
    @users = User.all
  end
  
  def edit
    @user = User.find(params[:id])
    if @user == current_user
    else
      redirect_to user_path(current_user)
    end
  end

  def update
    @user = User.find(params[:id])

    if @user == current_user
      if @user.update(user_params)
        flash[:notice] = "You have updated user successfully."
        redirect_to user_path(current_user)
      else
        render :edit
      end
    end
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :account_type)
  end
end
