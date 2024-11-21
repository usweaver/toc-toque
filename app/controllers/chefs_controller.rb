class ChefsController < ApplicationController
  skip_before_action :authenticate_user!, only: :show
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
  end

  def edit
  end
end
