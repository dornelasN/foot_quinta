module TeamsHelper
  def build_position_rows(valid_position)
    @team.players.select { |player| player.position == valid_position }
  end
end
