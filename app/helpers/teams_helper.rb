module TeamsHelper
  def setup_team(team)
    team.players = Array.new(3, Player.new) if team.players.empty?
    team
  end
end
