class ReviewsController < ApplicationController

  def create
    if user_signed_in?
      review = Review.create(review_params)
      # redirect_to spot_path(review.spot.id)
      respond_to do |format|
        format.html { redirect_to spot_path(review.spot.id) }
        format.json
      end
    else
      redirect_to root_path
    end
  end

  private

  def review_params
    params.require(:review).permit(:text).merge(user_id: current_user.id, spot_id: params[:spot_id])
  end

end
