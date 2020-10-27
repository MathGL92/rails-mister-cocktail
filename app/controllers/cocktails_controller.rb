# frozen_string_literal: true

class CocktailsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  before_action :set_cocktail, only: %i[show favorite]

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
    @review = if current_user
                Review.where(user_id: current_user.id).first_or_initialize
              else
                Review.new
              end
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    @cocktail.user = current_user
    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      raise
      render :new
    end
  end

  def favorite
    type = params[:type]
    case type
    when 'favorite'
      current_user.favorites << @cocktail
      redirect_back fallback_location: root_path, notice: "You favorited #{@cocktail.name}"
    when 'unfavorite'
      current_user.favorites.delete(@cocktail)
      redirect_back fallback_location: root_path, notice: "You unfavorited #{@cocktail.name}"
    else
      # Type missing, nothing happens
      redirect_back fallback_location: root_path, notice: 'Nothing happened.'
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
