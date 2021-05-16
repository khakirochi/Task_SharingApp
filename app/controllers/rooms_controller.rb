class RoomsController < ApplicationController
  before_action :redirect_signout_user,  except: [:index, :show]

  def index
    @rooms = Room.all
    
    # area search
    if params[:area].present?
      area_ptn = "%#{params[:area]}%"
      @rooms = @rooms.where("room_address like ?", area_ptn)
    end
    
    # keyword search
    if params[:keyword].present?
      keyword_ptn = "%#{params[:keyword]}%"
      @rooms = @rooms.where("room_name like ? OR room_intro like ?", keyword_ptn, keyword_ptn) 
    end
  
  end
  
  def show
    @room = Room.find(params[:id])
    @reservation = Reservation.new
  end
  
  def new
    @room = Room.new
  end
  
  def create
    @room = Room.new(room_params)
    if @room.save
      flash[:notice] = "ルーム登録に成功しました"
      redirect_to rooms_path
    else
      flash.now[:alert] = "ルーム登録に失敗しました"
      render :new
    end
  end
  
  def edit
    @room = Room.find(params[:id])
    redirect_invalid_owner(@room)
  end
  
  def update
    @room = Room.find(params[:id])
    redirect_invalid_owner(@room)

    if @room.update(room_params)
      flash[:notice] = "ルーム登録情報更新に成功しました"
      redirect_to rooms_path
    else
      flash.now[:alert] = "ルーム登録情報更新に失敗しました"
      render :edit
    end
  end
  
  def destroy
    @room = Room.find(params[:id])
    redirect_invalid_owner(@room)
    
    
    if is_reserved_by_others?(@room)
      flash.now[:alert] = "予約されているため，削除できませんでした"
      render :edit
    else
      rsrvs = Reservation.where(room_id: @room.id)
      @room.destroy
      rsrvs.map(&:destroy)  #remove linked reservations
      flash[:notice]="削除しました"
      redirect_to rooms_path
    end
  end
  
  def myrooms
    @myrooms = Room.where(user_id: session[:user_id])
  end
  
  private
  
  def room_params
    room_params = 
    params.require(:room).permit(
      :room_name,
      :room_address,
      :room_intro,
      :room_fee,
      :room_img
    )
    
    room_params[:user_id] = session[:user_id]
    room_params
  end
  
  def is_reserved_by_others?(room)
    Reservation
      .where(room_id: @room.id)
      .where.not(user_id: @room.user_id)
      .where("end_date >= ?", Date.current)
      .length > 0
  end
  
end