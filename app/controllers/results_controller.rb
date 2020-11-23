class ResultsController < ApplicationController
  before_action :login_required

  def index
    @songs = Song.all
    @results1 = account.p1
    @results2 = account.p2
  end

  def show
    @result = Result.find_by(id: params[:id])
  end
end
