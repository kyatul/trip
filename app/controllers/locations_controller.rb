class LocationsController < ApplicationController
  def index
    @locations = Location.all
  end

  def create
    @location = Location.new(location_params)

    if @location.save
      flash[:success] = "Location Created"
      redirect_to location_path(@location)
    else
      render 'new'
    end
  end

  def show
    @location = Location.find(params[:id])
  end

  def destroy
    @location = Location.find(params[:id])
    @location.destroy

    redirect_to locations_path
  end

  private

    def location_params
      params.require(:location).permit(:name, :city)
    end
end
