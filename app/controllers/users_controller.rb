class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  def create
    user_params = params.require(:user).permit(:user_name, :email, :password, :password_confirmation)
    @user = User.new(user_params)
    
    if @user.save
      flash[:notice] = "新規アカウントを作成しました"
      session[:user_id] = @user.id
      redirect_to home_path
    else
      flash.now[:alert] = "新規アカウント作成に失敗しました"
      render :new
    end
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  
  def edit_profile
    @user = User.find(session[:user_id])
  end
  
  def update_profile
    @user = User.find(session[:user_id])
    if @user.update(profile_params)
      flash[:notice] = "プロフィールを更新しました"
      #redirect_to user_path(@user)
      redirect_to settings_path
    else
      flash.now[:alert] = "プロフィールの更新に失敗しました"
      render :edit_profile
    end
  end
  
  def account
    @user = User.find(session[:user_id])
  end
  
  def edit_account
    @user = User.find(session[:user_id])
  end
  
  def update_account
    user_params = account_params
    @user = User.find(session[:user_id])
    
    if @user.present? && @user.authenticate(user_params[:password_previous])
      user_params.delete(:password_previous)
      
      if @user.update(user_params)
        flash[:notice] = "アカウント情報を更新しました"
        redirect_to settings_path
      else
        flash.now[:alert] = "アカウント情報の更新に失敗しました"
        render :edit_account
      end
    else
      flash.now[:alert] = "アカウント情報の更新に失敗しました"
      @error_message = "メールアドレスまたはパスワードが間違っています"
      render :edit_account
    end
    
  end

  def settings
    @user = User.find(session[:user_id])
  end
  
  def destroy
    @user = User.find(session[:user_id])
    @user.destroy
    session[:user_id] = nil
    flash[:notice] = "アカウントを削除しました"
    redirect_to "/"
  end

  private 
  def profile_params
    params.require(:user).permit(:user_name, :user_intro, :user_img)
  end

  def account_params
    params.require(:user).permit(:email, :password, :password_confirmation, :password_previous)
  end


end