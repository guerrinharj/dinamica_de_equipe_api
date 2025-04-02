class Api::ReviewsController < ApplicationController
    def create
        dinamica = Dinamica.find(params[:dinamica_id])
        review = dinamica.reviews.build(review_params)

        if review.save
            render json: review, status: :created
        else
            render json: review.errors, status: :unprocessable_entity
        end
    end

    private

    def review_params
        params.require(:review).permit(:comentario, :nota)
    end
end
