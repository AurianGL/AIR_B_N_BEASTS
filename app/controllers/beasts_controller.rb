class BeastsController < ApplicationController
  def create
    @beast = Beast.new(beast_params)
    if @beast.save
      redirect_to beast_path(@beast)
    else
      render 'new'
    end
  end

  def new
    @beast = Beast.new
  end

  private

  def beast_params
    params.require(:beast).permit(:name, :description, :address, :dangerosity, :price, :species)
  end
end
