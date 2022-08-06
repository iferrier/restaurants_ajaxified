class ReviewsController < ApplicationController
  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new(review_params)
    @review.restaurant = @restaurant

    respond_to do |format|
      if @review.save
        format.html { redirect_to restaurant_path(@restaurant, anchor: "review-#{@review.id}") }
        format.json
      else
        format.html { render 'restaurants/show' }
        format.json
      end
    end
  end

  private

  def review_params
    params.require(:review).permit(:content)
  end
end
