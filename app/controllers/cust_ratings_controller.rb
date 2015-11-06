class CustRatingsController < ApplicationController
  def update
  	@rating = CustRating.find(params[:id])
    @customer = @rating.customer_id
    if @rating.update_attributes(score: params[:score])
      	respond_to do |format|
        format.js
     		end
    end
  end
end
