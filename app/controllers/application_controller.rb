class ApplicationController < ActionController::Base
#  before_action :authenticate_user! 

 before_action :user_confirm, if: :devise_controller?
 

private
 def user_confirm
  devise_parameter_sanitizer.permit(:sign_up, keys: [:name,:profile,:occupation,:position])
 end

end
