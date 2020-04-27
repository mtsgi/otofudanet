module Api
  module V1
    class MusicsController < ApplicationController
      def index
        render json: { status: 'SUCCESS', index: Music.all.map { |m| {
          id: m.music_id,
          name: m.name,
          artist: m.artist,
          bpm: m.bpm.to_f,
          dispbpm: m.dispbpm,
          color: m.color.split(',').map{|c| c.strip.to_i},
          offset: m.offset,
          raku: -1,
          easy: m.easy,
          normal: m.normal,
          hard: m.hard,
          extra: -1,
          author: m.notesdesign,
          comment: m.comment,
          demo: m.demo,
          chart_url: request.base_url + api_v1_music_path(m.music_id),
          jacket_url: m.image,
          updated_at: m.updated_at
        } } }
      end

      def show
        @music = Music.find_by(music_id: params[:id])
        if @music
          send_data @music.data, type: 'application/json', disposition: 'inline'
        else
          render json: { status: 'FAILED', data: {
            "message": "music not found."
          } }
        end
      end
    end
  end
end
