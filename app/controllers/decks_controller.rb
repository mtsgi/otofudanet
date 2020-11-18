class DecksController < ApplicationController
  before_action :login_required

  def index
    @user = account
    @decks = @user.decks
  end
  
  def show
    @cards = Card.all
  end
end
