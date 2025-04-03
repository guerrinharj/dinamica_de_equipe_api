require 'rails_helper'

RSpec.describe Api::DinamicasController, type: :request do
    let(:dinamica) { create(:dinamica) }

    describe "GET /api/dinamicas" do
        it "returns all dinamicas with participantes and reviews" do
            create(:review, dinamica: dinamica, nota: 4)
            create(:review, dinamica: dinamica, nota: 5)

            get "/api/dinamicas"
            expect(response).to have_http_status(:ok)
        end
    end

    describe "GET /api/dinamicas/:id" do
        it "returns a specific dinamica with its reviews" do
            create(:review, dinamica: dinamica, comentario: "Primeiro review", nota: 4)

            get "/api/dinamicas/#{dinamica.id}"
            expect(response).to have_http_status(:ok)
        end
    end

    describe "POST /api/dinamicas" do
        it "creates a new dinamica with participantes" do
            dinamica_params = {
                dinamica: {
                    nome: "Nova Dinâmica",
                    descricao: "Descrição de teste",
                    participantes: ["Carla", "Edu"]
                }
            }

            post "/api/dinamicas", params: dinamica_params.to_json, headers: { "CONTENT_TYPE" => "application/json" }
            expect(response).to have_http_status(:created)
        end

        it "returns error if nome is missing" do
            post "/api/dinamicas", params: { dinamica: { descricao: "Faltando nome" } }.to_json,
                                    headers: { "CONTENT_TYPE" => "application/json" }

            expect(response).to have_http_status(:unprocessable_entity)
        end
    end

    describe "PATCH /api/dinamicas/:id" do
        it "updates an existing dinamica" do
            patch "/api/dinamicas/#{dinamica.id}",
                    params: { dinamica: { nome: "Nome Atualizado" } }.to_json,
                    headers: { "CONTENT_TYPE" => "application/json" }

            expect(response).to have_http_status(:ok)
        end
    end

    describe "DELETE /api/dinamicas/:id" do
        it "deletes a dinamica" do
            delete "/api/dinamicas/#{dinamica.id}"
            expect(response).to have_http_status(:no_content)
            expect(Dinamica.exists?(dinamica.id)).to be_falsey
        end
    end

    describe "GET /api/dinamicas/aleatoria" do
        it "returns a random dinamica" do
            create_list(:dinamica, 3)
            get "/api/dinamicas/aleatoria"
            expect(response).to have_http_status(:ok)
        end
    end
end
