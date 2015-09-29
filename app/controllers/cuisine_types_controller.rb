class CuisineTypesController < ApplicationController

	def index
		@cuisine_types = CuisineType.all
	end

	def show
		@cuisine_types = CuisineType.find(params[:id])
	end

end