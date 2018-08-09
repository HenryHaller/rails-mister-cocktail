class DosesController < ApplicationController
  before_action :set_cocktail, only: [:create, :new]
  def index
  end

  def new
    @ingredients = Ingredient.all
    @dose = Dose.new
    @dose.cocktail = @cocktail
  end

  def create
    @dose = Dose.new(dose_params)
    @dose.ingredient = Ingredient.find(params[:dose]["ingredient"])
    @dose.cocktail = @cocktail
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def delete
    raise
  end

  def edit
  end

  private

  def set_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def dose_params
    params.require(:dose).permit(:description)
  end

end
