module TeamsHelper
  def build_position_rows(valid_position)
    @team.players.select { |player| player.position == valid_position }
  end

  def formatted_date(date)
    Date.strptime(date.to_s, "%Y-%m-%d").strftime("%m/%d/%Y")
  end
end
