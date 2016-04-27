class ReviewsController < ApplicationController
  
  def index
    @reviews = Review.all
  end
  
  def new
  	@review = Review.new
  	@recipe = Recipe.find(params[:recipe_id])
  end

  def create
    @recipe = Recipe.find(params[:recipe_id])
    @review = Review.new(review_params)

    @review.chef = current_user
    @review.recipe = @recipe

    if @review.save
    	flash[:success] = "Your review was created succesfully"
    	redirect_to recipe_path(@recipe)
    else
    	flash[:danger] = "There was something wrong with your comment"
    	redirect_to recipe_path(@recipe)
    end
  end

  private

    def review_params
      params.require(:review).permit(:review)
    end



end