class ReviewsController < ApplicationController
  before_action :set_beast, only: [:show, :update, :edit, :destroy]

  def new
     @review = Review.new
     @booking = Booking.find(params[:booking_id])
  end

  def create
     @review = Review.new(review_params)
     @review.booking = Booking.find(params[:booking_id])
     if @review.save
       flash[:notice] = 'your review has been added'
       redirect_to beast_path(@review.booking.beast)
     else
      flash[:notice] = 'error'

       render "reviews/new"
     end
  end

   def update
     if @review.save(review_params)
       redirect_to @beast, notice: 'Review was successfully updated.'
     else
       render :edit
     end
   end

   def edit
   end

  def show
    @review = Review.new(review_params)
  end

  private

  def review_params
    params.require(:review).permit(:content, :stars)
  end

  def set_beast
    @beast = Beast.find(params[:beast_id])
  end
end
