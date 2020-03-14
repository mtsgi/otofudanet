class TopController < ApplicationController
  def index
    if account
      redirect_to home_path
    end
  end

  def fuda
  end

  def option
    if account
      @user = account
    else
      redirect_to :root
    end
  end

  def profile
    if account
      @user = account
      @icon = Icon.find_by(id: account.icon_id)
    else
      redirect_to :root
    end
  end

  def icon
    if account
      @user = account
      @icons = Icon.all
    else
      redirect_to :root
    end
  end

  def howto
  end

  def home
    if account
      @user = account
      @icon = Icon.find_by(id: account.icon_id)
    else
      redirect_to :root
    end
  end

  def admin
    unless account&.mail == ENV['ADMIN_MAIL']
      redirect_to :root
    end
    @musics = Music.all
    @users = User.all
    @icons = Icon.all
  end
end
