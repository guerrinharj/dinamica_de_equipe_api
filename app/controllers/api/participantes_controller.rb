class Api::ParticipantesController < ApplicationController
    def index
        participantes = [
            "Ana",
            "Bruno",
            "Carla",
            "Daniel",
            "Eduarda",
            "Felipe"
        ]

        render json: participantes
    end
end
