class ReviewsController < ApplicationController

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])    
    @review = @restaurant.build_review current_user, review_params
    
    if @review.save
      redirect_to restaurants_path
    else
      flash[:notice] = "You have already reviewed this restaurant"
      redirect_to restaurants_path
    end
  end

  def destroy
    @review = Review.find(params[:id])

    if current_user

      if @review.user_id == current_user.id
        @review.destroy
        flash[:notice] = 'Review deleted successfully'
        redirect_to '/restaurants'
      else
        redirect_to '/restaurants'
      end

    else
      flash[:notice] = "You can't delete this"
      redirect_to '/restaurants'
    end
    
  end

  def review_params
    params.require(:review).permit(:thoughts, :rating)
  end
  
end
