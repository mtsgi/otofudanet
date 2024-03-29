class DecksController < ApplicationController
  before_action :login_required

  def index
    @user = account
    @decks = @user.decks.order("created_at")
  end
  
  def show
    @deck = account.decks.find(params[:id])
    @cards = Card.months(@deck.slot1, @deck.slot2, @deck.slot3, @deck.slot4, @deck.slot5) # デッキに含まれている札を取得
  end

  def new
    @user = account
    @deck = Deck.new(user_id: @user.id, status: 0)
  end

  def create
    @deck = Deck.new(deck_params)
    if @deck.save
      redirect_to decks_path, notice: "デッキを登録しました。"
    else
      render "new"
    end
  end

  def edit
    @deck = account.decks.find(params[:id])
  end
  
  def update
    @deck = account.decks.find(params[:id])
    @deck.assign_attributes(deck_params)
    if @deck.save
      redirect_to @deck, notice: "変更を保存しました。"
    else
      render "edit"
    end
  end

  def destroy
    @deck = account.decks.find(params[:id])
    if @deck.sub? # プライマリじゃない場合のみ削除できる
      @deck.destroy
      msg = "デッキを削除しました。"
    else
      msg = "使用するデッキは削除できません。"
    end
    redirect_to decks_path, notice: "#{msg}"
  end

  def change_status
    @deck = account.decks.find(params[:id]) # 選んだやつ
    main_deck = account.decks.main # 今メインになってるやつ,リレーションオブジェクトで返ってくる(whereメソッドの検索と同じなので)

    if @deck.sub? # 選んだやつがメインじゃない時
      main_deck.each do |d| # 相当壊れてなければ１レコードしかないはずだけど万が一複数個mainになってたらそれが全部subになる
        d.sub! # 今メインのやつをサブに変更して
      end
      @deck.main! # 選んだやつをメインにする
      msg = "使用するデッキを変更しました。"
    else
      msg = "既に使用するデッキに選択されています。"
    end
    redirect_to decks_path, notice: "#{msg}"
  end

  private
  def deck_params
    params.require(:deck).permit(:user_id, :name, :slot1, :slot2, :slot3, :slot4, :slot5, :status)
  end
end
