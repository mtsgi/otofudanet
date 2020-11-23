require 'open-uri'

class Card
  attr_accessor(
      :identifier, # 識別子
      :image, # 画像
      :month, # 月
      :name, # 札名
      :point, # 得点
      :effect_name, :effect_label, :effect_text # 効果
  )
  include ActiveModel::Model

  def initialize(card)
    self.identifier = card['identifier']
    self.image = card['image']['url']
    self.month = card['month']
    self.name = card['name']
    self.point = card['point']
    self.effect_name = card['effect']['name']
    self.effect_label = card['effect']['label']
    self.effect_text = card['effect']['text']
  end
  
  class << self
    def all
      cards = Card.fetch_cards
      result = []
      cards.each do |card|
        result << Card.new(card)
      end
      result
    end
    
    def fetch_cards
      header = {'X-API-KEY' => '91c69bf8-3df5-445f-81e7-30b54ab4a7d4'}
      res = open('https://otofuda.microcms.io/api/v1/cards?limit=1000', header)
      code, message = res.status  
      if code == "200"
          @cards = ActiveSupport::JSON.decode(res.read)['contents']
      else
          @cards = []
      end
      @cards
    end

    def months *n # 指定した月の札一覧を返す,
      @cards = Card.all.select do |c|
        c if n.include?(c.month)
      end
    end
  end
end
