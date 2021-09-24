require 'tournament_libzal'

teams = ['A', 'B', 'C', 'D']
tournament = Tournament.new()

teams.each {|t| tournament.add_team(t)}

tournament.add_match(tournament.teams[0],tournament.teams[1],3,1)
tournament.add_match(tournament.teams[2],tournament.teams[3],0,0)
tournament.add_match(tournament.teams[0],tournament.teams[2],1,1)
tournament.add_match(tournament.teams[1],tournament.teams[3],2,3)
tournament.add_match(tournament.teams[0],tournament.teams[3],2,1)
tournament.add_match(tournament.teams[1],tournament.teams[2],3,1)

tournament.matches.each {|m| m.calc_points}
tournament.possition_table