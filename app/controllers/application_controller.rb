class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    include SessionsHelper

  private

  def require_user_logged_in
    unless logged_in
      redirect_to login_url
    end
    #ログインしてなかったら飛ばされるだけで、アカウントを判別するものではない
  end
  
  def require_user_correspondence
    unless current_user.id == User.find(params[:id]).id
      redirect_to login_url
    end
  end
end
