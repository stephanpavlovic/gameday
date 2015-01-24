class MatchdaysController < ApplicationController

  def new
    @matchday = Matchday.new
  end

  def create
    @matchday = Matchday.new(matchday_params)
  end

  def show
    @matchday = Matchday.find params[:id]
  end

  def index
    @matchdays = Matchday.all.order(:date)
  end

  protected

  def matchday_params
    params.require(:matchday).permit(:date, :league_id)
  end

end
