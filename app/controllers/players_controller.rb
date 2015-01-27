class PlayersController < ApplicationController

  def create
    team = params[:team]
    @player = Player.new(player_params)
    if @player.save
      render partial: 'matchdays/player', locals: { player: @player, team: team }
    else
      render :new
    end
  end

  protected

  def player_params
    params.require(:player).permit(:name, :team_id)
  end

end
