class SessionController < ApplicationController
  def new
  end
  
  def create
    @user = User.find_by(email: params[:email])
    if @user.present? && @user.authenticate(params[:password])
      flash[:notice] = "ログインしました"
      session[:user_id] = @user.id
      redirect_to home_path
    else
      flash.now[:alert] = "ログインに失敗しました"
      @error_message = "メールアドレスまたはパスワードが間違っています"
      render :new
    end
  end
  
  def destroy
    session[:user_id] = nil
    flash[:notice] = "ログアウトしました"
    redirect_to "/"
  end
  
end
