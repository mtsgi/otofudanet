require 'open-uri'

class Song
  attr_accessor :name, :song_id, :jacket, :artist, :easy, :normal, :hard
  include ActiveModel::Model

  def initialize(song)
    self.name = song['name']
    self.song_id = song['song_id']
    self.jacket = song['jacket']['url']
    self.artist = song['artist']
    self.easy = song['easy']
    self.normal = song['normal']
    self.hard = song['hard']
  end

  class << self
    def all
      songs = Song.fetch_songs
      result = []
      songs.each do |song|
        result << Song.new(song)
      end
      result
    end

    def find(song_id)
      Song.all.select { |song| song.song_id == song_id }
    end

    def fetch_songs
      header = {'X-API-KEY' => '91c69bf8-3df5-445f-81e7-30b54ab4a7d4'}
      res = open('https://otofuda.microcms.io/api/v1/songs?limit=1000', header)
      code, message = res.status
  
      if code == "200"
        @songs = ActiveSupport::JSON.decode(res.read)['contents']
      else
        @songs = []
      end

      @songs
    end
  end
end
