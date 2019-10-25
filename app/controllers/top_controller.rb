class TopController < ApplicationController
  def index
    if account
      redirect_to home_path
    end
  end

  def fuda
  end

  def option
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
end
