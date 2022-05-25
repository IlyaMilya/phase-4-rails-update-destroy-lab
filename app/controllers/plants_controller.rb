class PlantsController < ApplicationController

  # GET /plants
  def index
    plants = Plant.all
    render json: plants
  end

  # GET /plants/:id
  def show
    plant = Plant.find_by(id: params[:id])
    if plant 
    render json: plant
    else 
    render json: {error: "Bird Not Found"}, status: 404
    end 
  end

  #UPDATE /plants/:id
  def update 
  plant = Plant.find_by(id: params[:id])
  if plant 
    plant.update(plant_params)
    render json: plant 
  else 
    render json: {"error": "Bird Not Found"}, status: 404
  end
  end

  # POST /plants
  def create
    plant = Plant.create(plant_params)
    render json: plant, status: :created
  end

  def destroy 
    plant = Plant.find_by(id: params[:id])
    if plant 
      plant.destroy 
      head :no_content
    else 
      render json: {"error": "plant not found", status: 404}
    end
  end

  private

  def plant_params
    params.permit(:name, :image, :price, :is_in_stock)
  end
end
