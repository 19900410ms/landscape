class SpotsController < ApplicationController

  def index
    @spots = Spot.includes(:images).order("created_at DESC")
  end

  def show
    @spot = Spot.find(params[:id])
  end

  def new
    @spot = Spot.new
    @spot.images.build
  end

  def create
    @spot = Spot.new(spot_params)
    if @spot.save!
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @spot = Spot.find(params[:id])
  end

  def update
  end

  def destroy
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
      :recommend_season,
      :close_day,
      images_attributes: [:id, :image, :spot_id]).merge(user_id: current_user.id)
  end 
end
