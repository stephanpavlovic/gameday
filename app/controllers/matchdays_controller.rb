class MatchdaysController < ApplicationController

  def new
    @matchday = Matchday.new(league: League.first)
    @teams = @matchday.league.teams.order(:name)

  end

  def create
    @matchday = Matchday.new(matchday_params)
    if @matchday.save
      redirect_to matchday_path(@matchday)
    else
      render :new
    end
  end

  def show
    @matchday = Matchday.find params[:id]
    redirect_to matches_matchday_path(@matchday) if @matchday.matches.any?
  end

  def index
    @matchdays = Matchday.all.order(:date)
  end

  def shuffle
    @matchday = Matchday.find params[:id]
    @matchday.generate_games(params[:home_player_ids], params[:guest_player_ids])
    redirect_to matches_matchday_path(@matchday)
  end

  def matches
    @matchday = Matchday.find params[:id]
  end

  protected

  def matchday_params
    params.require(:matchday).permit(:date, :league_id, :home_team_id, :guest_team_id)
  end

end
