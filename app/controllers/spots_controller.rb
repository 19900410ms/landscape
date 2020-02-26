class SpotsController < ApplicationController

  before_action :set_params, only: [:show, :edit, :update, :destroy]

  def index
    @spots = Spot.includes(:images).order("created_at DESC")
  end

  def show
  end

  def new
    @spot = Spot.new
    @spot.images.build
  end

  def create
    @spot = Spot.new(spot_params)
    if @spot.save!
      redirect_to spot_path(@spot.id)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @spot.update(spot_params)
    if @spot.save!
      redirect_to spot_path(@spot.id)
    else
      render :edit
    end
  end

  def destroy
    if @spot.destroy
      redirect_to root_path
    else
      redirect_to spot_path(@spot.id)
    end
  end

  private

  def spot_params
    params.require(:spot).permit(
      :name,
      :division_id,
      :prefecture_id,
      :address,
      :station,
      :introduction,
      images_attributes: [:id, :image, :spot_id]).merge(user_id: current_user.id)
  end 

  def set_params
    @spot = Spot.find(params[:id])
  end
end
