module Api
  class LocationsController < ApiController
    def create
      @location = Location.new(location_params)
      
      if @location.save
        render json: @location
      else
        render json: @location.errors.full_messages, status: :unprocessable_entity
      end
    end
    
    def destroy
      @location = Location.find(params[:id])
      @location.try(:destroy)
      render json: {}
    end
    
    def index
      @locations = Location.all
      render json: @locations
    end
    
    def show
      @location = Location.find(params[:id])
      
      render json: @location
    end
    
    private
    
    def location_params
      params.require(:location).permit(
        :name,
        :category,
        :address,
        :ambience,
        :wifi,
        :attire,
        :noise_level,
        :wheelchair_accessible
      )
  end
end