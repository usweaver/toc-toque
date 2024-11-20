class BookingsController < ApplicationController
  def index
    @bookings_user = current_user.bookings
    @chefs = current_user.chefs
    @bookings_chef = Book
  end

  def show
  end

  def edit
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
