class BeastsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    if params[:query].present?
      @beasts = Beast.search(params[:query])
    else
      @beasts = Beast.all
    end
  end

  def show
    @beast = Beast.find(params[:id])
    @bookings = @beast.bookings
  end

  def create
    @beast = Beast.new(beast_params)
    if @beast.save
      redirect_to beast_path(@beast)
    else
      raise
      render 'new'
    end
  end

  def new
    @beast = Beast.new
  end

  private

  def beast_params
    params.require(:beast).permit(:name, :description, :address, :dangerosity, :price, :species, :photo)
  end
end
