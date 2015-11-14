class RatingsController < ApplicationController

	def new
		if params[:rating_type] == "CustRating"
			@average_rating = CustRating.find(params[:rating_id]).customer.average_rating(params[:score])
			CustRating.find(params[:rating_id]).update(score: @average_rating)
		elsif params[:rating_type] == "ProRating"
			@average_rating = ProRating.find(params[:rating_id]).professional.average_rating(params[:score])
			ProRating.find(params[:rating_id]).update(score: @average_rating)
		end


		respond_to do |format|
			format.json {
				render json: { average_rating: @average_rating }.to_json
			}
		end
	end
end
