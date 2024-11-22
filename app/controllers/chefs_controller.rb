class ChefsController < ApplicationController
  skip_before_action :authenticate_user!, only: :show

  def index
    @chefs = Chef.where(user_id: current_user.id)
  end

  def show
    @chef = Chef.find(params[:id])
    @booking = Booking.new
    @markers = [{
        lat: @chef.latitude,
        lng: @chef.longitude,
        marker_html: render_to_string(partial: "shared/marker")
      }]
  end

  def new
    @chef = Chef.new
  end

  def edit
    @chef = Chef.find(params[:id])
  end

  def create
    @chef = Chef.new(chef_params)
    @chef.user = current_user
    if @chef.save
      redirect_to chefs_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @chef = Chef.find(params[:id])
    @chef.update(chef_params)

    redirect_to chefs_path
  end

  def destroy

  end

  private

  def chef_params
    params.require(:chef).permit(:first_name, :last_name, :category, :phone_number, :email, :daily_price, :city, :chef_picture)
  end
end
