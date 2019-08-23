class BookingsController < ApplicationController
  before_action :set_beast, only: [:new, :show, :update, :edit, :destroy, :create]

  def create
    @booking = Booking.new(booking_params)
    @booking.beast = @beast
    @booking.user = current_user
    if @booking.save
      flash[:notice] = 'booking sent!'
      redirect_to beast_path(@beast)
    else
      render "bookings/new"
    end
  end

  def new
    if @beast.user == current_user
      flash[:alert] = 'user cannot be owner'
    else
    @booking = Booking.new
    end
  end

  def update
    if @booking.save(booking_params)
      redirect_to @beast, notice: 'Booking was successfully updated.'
    else
      render :edit
    end
  end

  def edit
  end

  def show
    @booking = Booking.new(booking_params)
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to dashboard_path
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :beast, :user)
  end

  def set_beast
    @beast = Beast.find(params[:beast_id])
  end
end
