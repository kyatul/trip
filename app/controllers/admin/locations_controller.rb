class Admin::LocationsController < ApplicationController
  def index
    @locations = Location.all
  end

  def new
    @destination_id = params[:destination_id]
  end

  def create
    @destination = Destination.find(params[:location][:destination_id])
    @location = @destination.locations.build(location_params)

    if @location.save
      flash[:success] = "Location Created"
      redirect_to admin_destination_path(@destination)
    else
      render 'new'
    end
  end

  def show
    @location = Location.find(params[:id])
    @reviews = @location.reviews
  end

  def destroy
    @location = Location.find(params[:id])
    @location.destroy

    redirect_to admin_locations_path
  end

  private

    def location_params
      params.require(:location).permit(:name, :city, :destination_id)
    end
end
