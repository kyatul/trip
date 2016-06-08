class DestinationsController < ApplicationController
  def index
    @destinations = Destination.all
  end

  def new
  end

  def create
    @destination = Destination.new(destination_params)

    if @destination.save
      flash[:success] = "Destination Created"
      redirect_to destinations_path
    else
      render 'new'
    end
  end

  def show
    @destination = Destination.find(params[:id])
    @locations = @destination.locations
  end

  def destroy
    @destination = Destination.find(params[:id])
    @destination.destroy

    redirect_to destinations_path
  end

  private

    def destination_params
      params.require(:destination).permit(:state, :city)
    end
end
