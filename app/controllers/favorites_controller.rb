class FavoritesController < ApplicationController

  def create
    @favorites = current_customer.favorites.create(params[:customer_id])

  end


end
