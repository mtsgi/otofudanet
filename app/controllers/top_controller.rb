class TopController < ApplicationController
  before_action :login_required, except: [:index, :fuda, :howto]

  def index
    if account
      redirect_to home_path
    end
  end

  def fuda
  end

  def option
    @user = account
  end

  def profile
    @user = account
    @icon = Icon.find_by(id: account.icon_id)

  end

  def icon
    @user = account
    @icons = Icon.all.order(:id)
  end

  def howto
  end

  def home
    @user = account
    @icon = Icon.find_by(id: account.icon_id)
  end

  def admin
    unless account&.mail == ENV['ADMIN_MAIL']
      redirect_to :root
    end
    @users = User.all
    @icons = Icon.all
    @decks = Deck.all
  end
end
