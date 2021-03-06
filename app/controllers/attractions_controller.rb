class AttractionsController < ApplicationController
  def index
    @attractions = Attraction.all
  end

  def show
    @attraction = Attraction.find(params[:id])
  end

  def new
    @attraction = Attraction.new
  end

  def create
    if is_admin?
      @attraction = Attraction.new(attraction_params)
      if @attraction.save
        redirect_to @attraction
      else
        render 'new'
      end
    end
  end

  def edit
    @attraction = Attraction.find(params[:id])
  end

  def update
    if is_admin?
      @attraction = Attraction.find(params[:id])
      if @attraction.update(attraction_params)
        redirect_to @attraction
      else
        render 'edit'
      end
    end
  end

  private
  def attraction_params
    params.require(:attraction).permit(:name, :tickets, :nausea_rating, :happiness_rating, :min_height)
  end
end
