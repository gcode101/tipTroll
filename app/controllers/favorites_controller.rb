class FavoritesController < ApplicationController



  def create
    current_customer.favorites.create(professional_id: params[:professional_id])
    redirect_to :back
  end

  def delete
    favorite = current_customer.favorites.find_by(professional_id: params[:professional_id])
    favorite.destroy unless favorite.nil?
    redirect_to :back
  end




end
