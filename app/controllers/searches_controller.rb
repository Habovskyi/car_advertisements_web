class SearchesController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  def index
    @user_searches = Search.where(user_id: current_user.id)
    @user_searches = @user_searches.page params[:page]
  end

  def new
    @search = Search.new
  end

  def create
    @search = Search.create(search_params.merge(user_id: current_user.id)) if current_user
    redirect_to cars_path(search_params)
  end

  private

  def search_params
    params.permit(:make, :model, :year_from, :year_to, :price_from, :price_to)
  end
end
