require 'tournament'
require 'csv'

teams = ['A', 'B', 'C', 'D']
tournament = Tournament::Tournament.new()

teams.each {|t| tournament.add_team(t)}

matches = CSV.parse(File.read("csv/matches.csv"), headers: true, converters: :numeric)

matches.each {|m| tournament.add_match(tournament.teams[tournament.teams.index {|t| t.name == m["team_a"]}],
                                       tournament.teams[tournament.teams.index {|t| t.name == m["team_b"]}],
                                       m["goals_team_a"],
                                       m["goals_team_b"])}

tournament.matches.each {|m| m.calc_points}
tournament.possition_table 