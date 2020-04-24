module Api
  module V1
    class MusicsController < ApplicationController
      def index
        render json: { status: 'SUCCESS', data: Music.all }
      end

      def show
        @music = Music.find_by(id: params[:id])
        if @music
          render json: { status: 'SUCCESS', data: {
            "name": @music.name
          } }
        else
          render json: { status: 'FAILED', data: {
            "message": "music not found."
          } }
        end
      end
    end
  end
end
