class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
    @chefs = Chef.all
    if params[:category].present?
      @chefs = Chef.where(category: params[:category])
    end
    if params[:query].present?
      @chefs = Chef.search_chef(params[:query])
    end
    @markers = @chefs.geocoded.map do |chef|
      {
        lat: chef.latitude,
        lng: chef.longitude,
        marker_html: render_to_string(partial: "shared/marker"),
        info_window_html: render_to_string(partial: "shared/info_window", locals: {chef: chef})
      }
    end
  end
end
