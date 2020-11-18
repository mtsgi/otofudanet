class DecksController < ApplicationController
  before_action :login_required

  def index
    
  end
  
  def show
    @cards = Card.all
  end
end
