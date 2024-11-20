class BookingsController < ApplicationController
  def index
    @bookings_users = current_user.bookings.order(start_date: :asc)
    @bookings_chefs = Booking.where(chef_id: current_user.chefs).order(start_date: :asc)
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def edit
  end

  def update
    @booking = Booking.find(params[:id])
    @booking.status = params[:status]
    @booking.save
    redirect_to bookings_path
  end

  def create
    @booking = Booking.new(booking_params)
    @chef = Chef.find(params[:chef_id])
    @booking.chef = @chef
    @booking.user = current_user
    if @booking.save
      redirect_to bookings_path
    else
      render "chefs/show", status: :unprocessable_entity
    end

  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end

end
