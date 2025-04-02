require 'rails_helper'

RSpec.describe Api::ReviewsController, type: :request do
    describe "POST /api/dinamicas/:dinamica_id/reviews" do
        let(:dinamica) { create(:dinamica) }

        context "with valid parameters" do
            it "creates a review and returns 201" do
                review_params = {
                    review: {
                        comentario: "Excelente dinâmica!",
                        nota: 5
                    }
                }

                post "/api/dinamicas/#{dinamica.id}/reviews",
                        params: review_params.to_json,
                        headers: { "CONTENT_TYPE" => "application/json" }

                expect(response).to have_http_status(:created)
            end
        end

        context "with invalid parameters" do
            it "fails without comentario" do
                post "/api/dinamicas/#{dinamica.id}/reviews",
                        params: { review: { nota: 4 } }.to_json,
                        headers: { "CONTENT_TYPE" => "application/json" }

                expect(response).to have_http_status(:unprocessable_entity)
            end

            it "fails with nota out of range" do
                post "/api/dinamicas/#{dinamica.id}/reviews",
                        params: { review: { comentario: "Nota inválida", nota: 10 } }.to_json,
                        headers: { "CONTENT_TYPE" => "application/json" }

                expect(response).to have_http_status(:unprocessable_entity)
            end

            it "fails if nota is missing" do
                post "/api/dinamicas/#{dinamica.id}/reviews",
                        params: { review: { comentario: "Sem nota" } }.to_json,
                        headers: { "CONTENT_TYPE" => "application/json" }

                expect(response).to have_http_status(:unprocessable_entity)
            end
        end
    end
end

