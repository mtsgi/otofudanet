class SongsController < ApplicationController
  def index
    @songs = Song.all
  end

  def show
    songs = Song.find(params[:id])
    if songs.size == 0
      flash.notice = "楽曲が見つかりませんでした。"
      redirect_to(songs_path)
    elsif songs.first.coming
      flash.notice = "楽曲実装までお待ち下さい。"
      redirect_to(songs_path)
    end
    @song = songs.first
  end
end
