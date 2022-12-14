class AnimalsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    if params[:query].present?
      @animals = policy_scope(Animal).search_by_species_and_name(params[:query])
    else
      @animals = policy_scope(Animal)
    end
    @markers = @animals.geocoded.map do |animal|
      {
        lat: animal.latitude,
        lng: animal.longitude,
        info_window: render_to_string(partial: "info_window", locals: { animal: animal })
      }
    end
  end

  def show
    @animal = Animal.find(params[:id])
    @user = @animal.user
    @booking = Booking.new
    authorize @animal
    @markers = [{
      lat: @animal.latitude,
      lng: @animal.longitude,
      info_window: render_to_string(partial: "info_window", locals: { animal: @animal })
    }]
    @other_animals_from_owner = Animal.find(params[:id]).user.owned_animals
  end

  def new
    @animal = Animal.new
    authorize @animal
  end

  def create
    @animal = Animal.new(animal_params)
    @animal.user = current_user
    authorize @animal
    if @animal.save
      redirect_to animals_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def animal_params
    params.require(:animal).permit(:species, :name, :price, :photo, :address, :description)
  end
end
