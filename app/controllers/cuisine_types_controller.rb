class CuisineTypesController < ApplicationController

	def index
		@cuisine_types = CuisineType.all
		@current_user = User.find_by_id(session[:user_id])
	end

	def show
		@cuisine_types = CuisineType.find(params[:id])
	end

end