class PlantsController < ApplicationController
	def index 
		plants= Plant.all 
		render json: plants
	
	end

	def show
		plant= Plant.find_by(id: params[:id])
		render json: plant

	end

	def create
		plants= Plant.create(plant_params)
		if plants
			render json: plants, status: :created
		else 
			render json: {error: "not valid"}, status: :not_created
		end
	end
	 
	private

	def plant_params
		params.permit(:name, :image, :price)
	end
	end
