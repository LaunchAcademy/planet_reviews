class ReviewsController < ApplicationController
  def create
    @planet = Planet.find(review_params[:planet_id])
    @review = @planet.reviews.build
    @review.assign_attributes(review_params)
    @review.user = current_user
    if @review.save
      ReviewMailer.new_review(@planet).deliver_later
      flash[:notice] = "Thanks for your input!"
    else
      flash[:notice] = "Something went wrong"
    end
    redirect_to @planet
  end

  protected
  def review_params
    params.require(:review).permit(:rating, :body, :planet_id)
  end
end
