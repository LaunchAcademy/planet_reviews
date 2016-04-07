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

  def index
    @planets = Planet.limit(10)
  end

  def show
    @planet = Planet.find(params[:id])
    @review = @planet.reviews.build
  end

  protected
  def planet_params
    params.require(:planet).permit(
      :name,
      :diameter_in_km,
      :mass_in_kg,
      :moons,
      :min_temp_in_c,
      :max_temp_in_c,
      :description
    )
  end
end
