class ReviewsController < ApplicationController
  before_action :set_review, only: [:edit, :update]

  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @review = Review.new(review_params)
    @review.cocktail = @cocktail
    @review.user = current_user

    if @review.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def update
    @review.update(review_params)

    redirect_to cocktail_path(@review.cocktail)
  end

  private

  def set_review
    @review = Review.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
