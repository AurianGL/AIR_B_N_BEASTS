class BeastsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @beasts = Beast.all

    @beasts = @beasts.order("#{params[:sorting]} ASC") if params[:sorting].present?

    if params[:query].present?
      @beasts = @beasts.search(params[:query])
    end
  end

  def show
    @beast = Beast.find(params[:id])
    @bookings = @beast.bookings
    @booking = Booking.where(user: current_user, beast: @beast).first
    @reviews = @beast.reviews
  end

  def create
    @beast = current_user.beasts.create!(beast_params)
    # @beast = Beast.new(beast_params)
    if @beast.save
      redirect_to beast_path(@beast)
    else
      render 'new'
    end
  end

  def new
    @beast = Beast.new
  end

  def destroy
    @beast = Beast.find(params[:id])
    @beast.destroy
    redirect_to dashboard_path
  end

  private

  def beast_params
    params.require(:beast).permit(:name, :description, :address, :dangerosity, :price, :species, :photo)
  end
end
