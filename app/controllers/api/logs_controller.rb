class Api::LogsController < ApplicationController
    def index
        logs = Log.order(created_at: :desc)
        render json: logs
    end
end
