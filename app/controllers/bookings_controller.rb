class BookingsController < ApplicationController
  before_action :set_beast, only: [:new, :show, :update, :edit, :destroy, :create]

  def create
    @booking = Booking.new(booking_params)
    @booking.beast = @beast
    if @booking.save
      redirect_to beast_path(@beast)
    else
      render "beasts/show"
    end
  end

  def new
    @booking = Booking.new
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

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :beast, :user)
  end

  def set_beast
    @beast = Beast.find(params[:beast_id])
  end
end
