class DecksController < ApplicationController
  before_action :login_required

  def index
    @user = account
    @decks = @user.decks
  end
  
  def show
    @cards = Card.all
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

  private
  def deck_params
    params.require(:deck).permit(:user_id, :name, :slot1, :slot2, :slot3, :slot4, :slot5, :status)
  end
end
