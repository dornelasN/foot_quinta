class PlayersController < ApplicationController
  before_action :admin_user, only: [:new, :create, :destroy]
  def new
    @player = Player.new
  end

  def index
    @team = Team.find(params[:team_id])
    @players = @team.players
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

  def destroy
    @player = Player.find(params[:id])
    @player.destroy
    flash[:success] = 'Player deleted'
    redirect_to request.referrer
  end

  private

  def player_params
    params.require(:player).permit(:name, :date_of_birth, :position)
  end
end
