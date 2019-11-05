class ResultsController < ApplicationController

  def index
    if account
      @results1 = account.p1
      @results2 = account.p2
    else
      redirect_to :root
    end
  end
end
