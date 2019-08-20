class BookingsController < ApplicationController
  def create
    @beast = Beast.find(params[:beast_id])
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
  end

  def show
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :beast, :user)
  end
end
