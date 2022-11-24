class PlantsController < ApplicationController
   wrap_parameters format: []
    # Get /plants
    def index
        plants=Plant.all
        render json: plants, status: :ok
    end
    
    # GET /plants/:id
    def show
      plant=Plant.find_by(id:params[:id])

      if plant
      render json: plant, status: :found
      else 
        render json: {error:"Item does not exist"}, status: :not_found
      end
    end
    
    # POST /plants
    def create
      plant=Plant.create(plant_params)
      render json: plant, status: :created 
    end

    private
    def plant_params
        params.permit(:name, :image, :price)
    end
end
