class PlanetsController < ApplicationController
  def new
    @planet = Planet.new
  end

  def create
    @planet = Planet.new(planet_params)
    @planet.user = current_user
    if @planet.save
      redirect_to planet_path(@planet), notice: "New planet, #{@planet.name}, created."
    else
      render :new
    end
  end

  def show
    @planet = Planet.find(params[:id])
    @review = @planet.reviews.build
  end

  protected
  def planet_params
    params.require(:planet).permit(:name, :mass, :description)
  end
end
