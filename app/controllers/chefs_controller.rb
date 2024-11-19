class ChefsController < ApplicationController
  skip_before_action :authenticate_user!, only: :show
  def show
    @chef = Chef.find(params[:id])
    @booking = Booking.new
  end

  def new
  end

  def edit
  end
end
