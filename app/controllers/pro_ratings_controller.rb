class ProRatingsController < ApplicationController
  def update
  	@rating = Rating.find(params[:id])
    @professional = @rating.professional
    if @rating.update_attributes(score: params[:score])
      	respond_to do |format|
        format.js
     		end
   	end
	end
end
