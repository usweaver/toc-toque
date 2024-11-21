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
  end
end
