class CommentsController < ApplicationController

  def new
    @current_user = User.find_by_id(session[:user_id])
    @restaurant = Restaurant.find(params[:restaurant_id])
    @comment = Comment.new
  end

  def create
  	@current_user = User.find_by_id(session[:user_id])
    @restaurant = Restaurant.find(params[:restaurant_id])
    @comment = Comment.new(comment_params)
    @comment.user = @current_user
    @comment.restaurant = @restaurant
    if @comment.save 
    	respond_to do |format|
        	format.html { redirect_to restaurant_path(@restaurant) }
        	format.js
    	end
    else
      render 'new'
  	end
  end

  private 
  def comment_params
  	params.require(:comment).permit(:title, :text)
  end

end