class Admin::ReviewsController < ApplicationController
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
      redirect_to admin_location_path(@location.id)
    else
      redirect_to admin_location_new_review_path(:location_id => @location.id)
    end
  end

  def status
    @review = Review.find(params[:id])

    @review.status == 'approve' ? @review.update(status: 'unapprove') : @review.update(status: 'approve')
    redirect_to admin_location_path(:id => @review.location_id)
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy

    redirect_to admin_location_path(:id => @review.location_id)
  end

  private

    def review_params
      params.require(:review).permit(:comment, :rating, :location_id)
    end
end
