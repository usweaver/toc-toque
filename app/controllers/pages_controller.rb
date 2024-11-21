class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
    @chefs = Chef.all
    if params[:query].present?
      @chefs = Chef.search_chef(params[:query])
    end
  end
end
