require 'open-uri'

class Song
  attr_accessor(
    :song_id,
    :name, :jacket, :artist, :illustrator,
    :easy, :normal, :hard,
    :easy_notes, :normal_notes, :hard_notes,
    :easy_nd, :normal_nd, :hard_nd,
    :easy_video, :normal_video, :hard_video,
    :comment, :copyright, :coming,
    :bpm, :dispbpm, :color
  )
  include ActiveModel::Model

  def initialize(song)
    self.song_id = song['song_id']

    self.name = song['name']
    self.jacket = song['jacket']['url']
    self.artist = song['artist']
    self.illustrator = song['illustrator']

    self.easy = song['easy']
    self.normal = song['normal']
    self.hard = song['hard']

    self.easy_notes = song['easy_notes']
    self.normal_notes = song['normal_notes']
    self.hard_notes = song['hard_notes']

    self.easy_nd = song['easy_nd']
    self.normal_nd = song['normal_nd']
    self.hard_nd = song['hard_nd']

    self.easy_video = song['easy_video']
    self.normal_video = song['normal_video']
    self.hard_video = song['hard_video']

    self.comment = song['comment']
    self.copyright = song['copyright']
    self.coming = song['coming']

    self.bpm = song['bpm']
    self.dispbpm = song['dispbpm']
    self.color = song['color'].to_s.split(",").map(&:strip)
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
