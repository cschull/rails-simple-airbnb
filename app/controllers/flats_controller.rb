class FlatsController < ApplicationController
  before_action :find_flat, only: [:show, :edit, :destroy, :update]

  def index
    @flats = Flat.all
  end

  def show
    @flat
  end

  def edit
    @flat

  end

  def update
    @flat.update
    redirect_to flat_path(@flat)
  end

  def new
    @flat = Flat.new
  end

  def create
    @flat = Flat.new(flat_params)
    @flat.save
    redirect_to flat_path(@flat)
  end

  def destroy
    @flat.destroy
    redirect_to flats_path
  end

  private

  def flat_params
    params.require(:flat).permit(:name, :address, :description, :price_per_night, :number_of_guests)
  end

  def find_flat
    @flat = Flat.find(params[:id])
  end

end
