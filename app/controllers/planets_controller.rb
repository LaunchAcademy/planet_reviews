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

  def index
    if params[:q] == ''
      flash[:notice] = 'Please specify a search phrase'
    end
    if params[:q].present?
      @planets = Planet.search(params[:q])
    else
      @planets = Planet.all
    end
  end

  protected
  def planet_params
    params.require(:planet).permit(:name, :mass, :description)
  end
end
