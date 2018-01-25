class GamesController < ApplicationController
  before_action :admin_user, only: [:new, :create, :destroy]
  def new
    @game = Game.new
  end

  def index
    @team = Team.find(params[:team_id])
    @games = @team.games
  end

  def create
    @team = Team.find(params[:team_id])
    @game = @team.games.build(game_params)
    if @game.save
      flash[:success] = 'Game created.'
      redirect_to @team
    else
      render @team
    end
  end

  def destroy
    @game = Game.find(params[:id])
    @team = Team.find_by_id(@game.team_id)
    @game.destroy
    flash[:success] = 'Game deleted'
    redirect_to request.referrer || @team
  end

  private

  def game_params
    params.require(:game).permit(:cuervos_goals, :adversary_team, :adversary_goals)
  end
end
