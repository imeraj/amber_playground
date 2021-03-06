class PetController < ApplicationController
  getter pet = Pet.new

  before_action do
    only [:show, :edit, :update, :destroy] { set_pet }
  end

  def index
    pets = Pet.query
    render "index.slang"
  end

  def show
    render "show.slang"
  end

  def new
    render "new.slang"
  end

  def edit
    render "edit.slang"
  end

  def create
    pet = Pet.new pet_params.validate!

    if pet.save
      redirect_to action: :index, flash: {"success" => "Pet has been created."}
    else
      flash[:danger] = "Could not create Pet!"
      render "new.slang"
    end
  end

  def update
    pet = Pet.find!(params["id"])
    pet.name = pet_params[:name]
    pet.breed = pet_params[:breed]
    pet.age = pet_params[:age].to_i

    if pet.save!
      redirect_to action: :index, flash: {"success" => "Pet has been updated."}
    else
      flash[:danger] = "Could not update Pet!"
      render "edit.slang"
    end
  end

  def destroy
    pet.delete
    redirect_to action: :index, flash: {"success" => "Pet has been deleted."}
  end

  private def pet_params
    params.validation do
      required :name
      required :breed
      required :age
    end
  end

  private def set_pet
    @pet = Pet.find!(params[:id])
  end
end
