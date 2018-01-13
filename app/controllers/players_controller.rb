class PlayersController < ApplicationController
  def new
    @player = Player.new
  end

  def create
    @team = Team.find(params[:team_id])
    @player = @team.players.build(player_params)
    if @player.save
      flash[:success] = 'Player created.'
      redirect_to @team
    else
      render @team
    end
  end

  private

  def player_params
    params.require(:player).permit(:name, :date_of_birth, :position)
  end
end
