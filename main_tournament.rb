require './team.rb'
require './match.rb'
require './tournament.rb'


#Main
tournament = Tournament.new()

tournament.teams << Team.new('A')
tournament.teams << Team.new('B')
tournament.teams << Team.new('C')
tournament.teams << Team.new('D')

tournament.matches << Match.new(tournament.teams[0],tournament.teams[1],3,1)
tournament.matches << Match.new(tournament.teams[2],tournament.teams[3],0,0)
tournament.matches << Match.new(tournament.teams[0],tournament.teams[2],1,1)
tournament.matches << Match.new(tournament.teams[1],tournament.teams[3],2,3)
tournament.matches << Match.new(tournament.teams[0],tournament.teams[3],2,1)
tournament.matches << Match.new(tournament.teams[1],tournament.teams[2],3,1)

tournament.matches.each {|m| m.calc_points}
tournament.possition_table