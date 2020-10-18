class CocktailsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_cocktail, only: [:show]

  def index
    if params[:query].present?
      @query = params[:query]
      @cocktails = Cocktail.where("name Like '%#{params[:query]}%'")
    else
      @cocktails = Cocktail.all
    end
  end

  def show
    @dose = Dose.new
    if current_user
      @review = Review.where(user_id: current_user.id).first_or_initialize
    else
      @review = Review.new
    end
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  private

  def set_cocktail
    @cocktail = Cocktail.find(params[:id])
  end

  def cocktail_params
    params.require(:cocktail).permit(:name, :photo)
  end
end
