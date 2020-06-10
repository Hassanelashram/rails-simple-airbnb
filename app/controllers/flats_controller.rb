class FlatsController < ApplicationController
 before_action :set_flat, only: [:show, :edit, :update, :destroy]
  def index
    if params[:query].present?
      @query = params[:query]
      @flats = Flat.where("name Like '%#{params[:query]}%'")
      else
      @flats = Flat.all
    end
  end

  def show
  end

  def new
    @flat = Flat.new
  end

  def create
    @flat = Flat.new(flat_params)
    @flat.save
    redirect_to @flat
  end

  def edit
  end

  def update
    @flat.update(flat_params)
    @flat.save
    redirect_to @flat
  end

  def destroy
    @flat.destroy
    redirect_to root_url
  end


  private
  def set_flat
    @flat = Flat.find(params[:id])
  end

  def flat_params
    params.require(:flat).permit(:name, :address, :number_of_guests, :price_per_night)
  end
end
