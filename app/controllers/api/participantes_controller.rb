class Api::ParticipantesController < ApplicationController
    def index
        participantes = Dinamica.pluck(:participantes).flatten.compact.uniq.sort

        render json: participantes
    end
end
