class ReviewsController < ApplicationController

  def show
    @spot = Spot.find(params[:id])
    @reviews = Review.all.order("created_at DESC")
  end

  def create
    if user_signed_in?
      review = Review.create(review_params)
      redirect_to spot_path(review.spot.id)
    else
      redirect_to root_path
    end
  end

  private

  def review_params
    params.require(:review).permit(:text).merge(user_id: current_user.id, spot_id: params[:spot_id])
  end

end
