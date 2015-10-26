class RestaurantsController < ApplicationController
	
	before_action :authenticate_user 

	def index
		@restaurants = Restaurant.all
		respond_to do |format|
			format.html
			format.json { render json:@restaurants }
		end
	end

	def show
		@restaurant = Restaurant.find(params[:id])
		@current_user = User.find_by_id(session[:user_id])
		respond_to do |format|
			format.html
			format.json { render json:@restaurant }
		end
	end

	def new
		@restaurant = Restaurant.new
	end

	def create
		@restaurant = Restaurant.new(restaurant_params)

		if  @restaurant.save
			redirect_to @restaurant
		else
			render 'new'
		end
	end

	def edit
		@restaurant = Restaurant.find(params[:id])
	end

	def update
		@restaurant = Restaurant.find(params[:id])

		if @restaurant.update(restaurant_params)
			redirect_to @restaurant
		else
			render 'edit'
		end
	end

	def destroy
    	@restaurant = Restaurant.find(params[:id])
    	@restaurant.destroy
 
    	redirect_to @restaurant
    end

	private
		def restaurant_params
			params.require(:restaurant).permit(:name, :address, :capacity, :cuisine_type_id, :image)
		end

end