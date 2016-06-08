class ReviewsController < ApplicationController
  def index
    @reviews = Location.find(params[:id]).reviews
    @location_id = params[:id]
  end

  def new
    @location_id = params[:location_id]
  end

  def create
    @location = Location.find(params[:review][:location_id])
    @review = @location.reviews.build(review_params)

    if @review.save
      flash[:success] = "Review Submitted"
      redirect_to location_path(@location.id)
    else
      redirect_to location_new_review_path(:location_id => @location.id)
    end
  end

  private

    def review_params
      params.require(:review).permit(:comment, :rating, :location_id)
    end
end
