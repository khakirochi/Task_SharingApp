class ApplicationController < ActionController::Base
  def redirect_signout_user
    if session[:user_id].blank?
      flash.now[:alert] = "ログインしてください"
      render "session/new"
    end
  end
  
  def redirect_invalid_owner(obj)
    if obj.user_id != session[:user_id]
      redirect_to home_path
    end
  end
end
