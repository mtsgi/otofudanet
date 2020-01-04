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
    else
      redirect_to :root
    end
  end

  def howto
  end

  def home
    if account
      @user = account
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
  end
end
