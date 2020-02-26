class ReviewsController < ApplicationController

  def create
    review = Review.create(review_params)
    redirect_to spot_path(review.spot.id), notice: 'コメントしました'
  end

  private

  def review_params
    params.require(:review).permit(:text).merge(user_id: current_user.id, spot_id: params[:spot_id])
  end

end
