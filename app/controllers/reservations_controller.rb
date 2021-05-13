class ReservationsController < ApplicationController
  before_action :redirect_signout_user
  
  def index
    @reservations = Reservation.all.order(created_at: "DESC")
  end
  
  def show
    @reservation = Reservation.find(params[:id])
  end
  
  def new
    @reservation = Reservation.new
  end
  
  def create
    @reservation = Reservation.new(reservation_params)
    redirect_invalid_owner(@reservation)
    if @reservation.save
      flash[:notice] = "ルーム予約に成功しました"
      redirect_to reservations_path
    else
      flash.now[:alert] = "ルーム予約に失敗しました"
      render :new
    end
  end
  
  def confirm
    @reservation = Reservation.new(reservation_params)
    redirect_invalid_owner(@reservation)
    @room = Room.find(reservation_params[:room_id])
    @reserved_days = get_reserved_days(reservation_params)
    
    if !@reservation.valid?
      render "rooms/show"
    end
  end
  
  def edit
    @reservation = Reservation.find(params[:id])
    redirect_invalid_owner(@reservation)
  end
  
  def update
    @reservation = Reservation.find(params[:id])
    redirect_invalid_owner(@reservation)
    if @reservation.update(reservation_params)
      flash[:notice] = "ルーム予約情報更新に成功しました"
      redirect_to reservations_path
    else
      flash.now[:alert] = "ルーム予約情報更新に失敗しました"
      render :edit
    end
  end
  
  def destroy
    @reservation = Reservation.find(params[:id])
    redirect_invalid_owner(@reservation)
    @reservation.destroy
    flash[:notice]="予約を取り消しました"
    redirect_to reservations_path
  end
  
  private
  
  def reservation_params
    reservation_params = 
    params.require(:reservation).permit(
      :start_date,
      :end_date,
      :total_users,
      :room_id,
      :user_id
    )

    #evaluate total fee
    total_fee = get_total_fee(reservation_params)
    reservation_params[:total_fee] = total_fee
    
    reservation_params
  end
  
  def get_total_fee(reservation_params)
    room          = Room.find(reservation_params[:room_id])
    i_room_fee    = room.room_fee.to_i
    i_total_users = reservation_params[:total_users].to_i
    
    i_total_users * i_room_fee * get_reserved_days(reservation_params)
  
  end
    
  def get_reserved_days(reservation_params)
    start_date = reservation_params[:start_date]
    end_date   = reservation_params[:end_date]
    
    if start_date.blank? || end_date.blank?
      reserved_days = 0
    else
      reserved_seconds = Time.zone.parse(end_date) - Time.zone.parse(start_date)
      reserved_days    = reserved_seconds / 1.day
    end
    
    reserved_days        
  end
  
end