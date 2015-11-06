class RatingsController < ApplicationController

	def new
		if params[:rating_type] == "CustRating"
			CustRating.find(params[:rating_id]).update(score: params[:score].to_i)
			@average_rating = CustRating.find(params[:rating_id]).customer.average_rating
		elsif params[:rating_type] == "ProRating"
			ProRating.find(params[:rating_id]).update(score: params[:score].to_i)
			@average_rating = ProRating.find(params[:rating_id]).professional.average_rating
		end


		respond_to do |format|
			format.json {
				render json: { average_rating: @average_rating }.to_json
			}
		end
	end
end
