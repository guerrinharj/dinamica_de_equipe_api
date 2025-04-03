class Api::ParticipantesController < ApplicationController
    def index
        participantes = Rails.cache.fetch("participantes", expires_in: 10.minutes) do
            ["Ana", "Bruno", "Carla", "Daniel", "Eduarda", "Felipe"]
        end
    
        render json: participantes
    end
    
end
