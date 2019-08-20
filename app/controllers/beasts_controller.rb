class BeastsController < ApplicationController
  def index
    @beasts = Beast.all
  end

  def show
    @beast = Beast.find(params[:id])
  end
end
