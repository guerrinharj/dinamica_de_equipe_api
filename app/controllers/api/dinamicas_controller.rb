class Api::DinamicasController < ApplicationController
    before_action :set_dinamica, only: [:show, :update, :destroy]

    def index
        dinamicas = Rails.cache.fetch("dinamicas_index", expires_in: 10.minutes) do
            Dinamica.all.includes(:reviews).map do |dinamica|
                dinamica.as_json(
                    methods: :avaliacao_media,
                    include: :reviews,
                    only: [:id, :nome, :descricao, :participantes]
                )
            end
        end

        render json: dinamicas
    end

    def show
        render json: @dinamica.as_json(
            methods: :avaliacao_media,
            include: :reviews,
            only: [:id, :nome, :descricao, :participantes]
        )
    end

    def create
        dinamica = Dinamica.new(dinamica_params)
        if dinamica.save
            Rails.cache.delete("dinamicas_index")
            Rails.cache.delete("dinamica_aleatoria")
            render json: dinamica, status: :created
        else
            render json: dinamica.errors, status: :unprocessable_entity
        end
    end

    def update
        if @dinamica.update(dinamica_params)
            Rails.cache.delete("dinamicas_index")
            Rails.cache.delete("dinamica_aleatoria")
            render json: @dinamica
        else
            render json: @dinamica.errors, status: :unprocessable_entity
        end
    end

    def destroy
        @dinamica.destroy
        Rails.cache.delete("dinamicas_index")
        Rails.cache.delete("dinamica_aleatoria")
        head :no_content
    end

    def aleatoria
        dinamica = Rails.cache.fetch("dinamica_aleatoria", expires_in: 5.minutes) do
            Dinamica.order("RANDOM()").first&.as_json(
                methods: :avaliacao_media,
                include: :reviews,
                only: [:id, :nome, :descricao, :participantes]
            )
        end

        render json: dinamica
    end

    private

    def set_dinamica
        @dinamica = Dinamica.find(params[:id])
    end

    def dinamica_params
        params.require(:dinamica).permit(:nome, :descricao, participantes: [])
    end
end
