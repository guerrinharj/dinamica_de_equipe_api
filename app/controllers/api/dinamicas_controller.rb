class Api::DinamicasController < ApplicationController
    before_action :set_dinamica, only: [:show, :update, :destroy]

    def index
        dinamicas = Dinamica.all.includes(:reviews)
        render json: dinamicas.as_json(methods: :avaliacao_media, include: :reviews)
    end

    def show
        render json: @dinamica.as_json(methods: :avaliacao_media, include: :reviews)
    end

    def create
        dinamica = Dinamica.new(dinamica_params)
        if dinamica.save
            render json: dinamica, status: :created
        else
            render json: dinamica.errors, status: :unprocessable_entity
        end
    end

    def update
        if @dinamica.update(dinamica_params)
            render json: @dinamica
        else
            render json: @dinamica.errors, status: :unprocessable_entity
        end
    end

    def destroy
        @dinamica.destroy
        head :no_content
    end

    def aleatoria
        dinamica = Dinamica.order("RANDOM()").first
        render json: dinamica.as_json(methods: :avaliacao_media, include: :reviews)
    end

    private

    def set_dinamica
        @dinamica = Dinamica.find(params[:id])
    end

    def dinamica_params
        params.require(:dinamica).permit(:nome, :descricao)
    end
end
