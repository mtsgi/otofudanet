class MusicsController < ApplicationController
    def index
        @musics = Music.all
    end

    def show
        @music = Music.find_by(id: params[:id])
    end

    def update
        @music = Music.find( params[:id] )
        if( account&.mail == ENV['ADMIN_MAIL'] )
          # 編集時
          if @music.update(params.require(:music).permit(:name, :artist, :image, :notesdesign, :easy, :normal, :hard))
            flash.notice = @music.name + "の情報を更新しました。"
            redirect_back(fallback_location: root_path)
          end
        else
            flash.notice = "権限がありません。"
            redirect_to :root
        end
    end
end
