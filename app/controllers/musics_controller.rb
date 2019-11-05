class MusicsController < ApplicationController
    def index
        @musics = Music.all
    end

    def show
        @music = Music.find_by(id: params[:id])
    end
end
