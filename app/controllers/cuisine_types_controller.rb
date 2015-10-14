class CuisineTypesController < ApplicationController

	def index
		@cuisine_types = CuisineType.all
		@current_user = User.find_by_id(session[:user_id])
	end

	def show
		@current_user = User.find_by_id(session[:user_id])
		@cuisine_type = CuisineType.find(params[:id])
	end

end