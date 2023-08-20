class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  
  def after_sign_in_path_for(resource)
    maps_path # ログイン後に開くページを指定
  end
  
   def after_sign_out_path_for(resource)
    root_path #ログアウト後の遷移先を指定
   end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
