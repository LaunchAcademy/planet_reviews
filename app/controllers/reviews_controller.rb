class ReviewsController < ApplicationController
  def create
    @planet = Planet.find(review_params[:planet_id])
    @review = @planet.reviews.build(review_params)
    @review.user = current_user

    if @review.save
      flash[:notice] = "Thanks for your input!"
    else
      flash[:error] = "Something is wrong with your review."
    end
    redirect_to @planet
  end

  protected
  def review_params
    params.require(:review).permit(:rating, :body, :planet_id)
  end
end
