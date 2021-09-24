require './gem/lib/team.rb'
require './gem/lib/match.rb'
require './gem/lib/logging.rb'
class Tournament
    include Logging
    attr_accessor :matches, :teams
    
    def initialize()
        @matches = []
        @teams = []
        log("Initializing Tournament")
    end

    def possition_table
        log("Final standings of Tournament.")
        @teams.each {|team| team.calc_difference}
        @teams = @teams.sort_by {|t| [t.total_poins, t.goals_difference]}.reverse
        puts "Final Tournament standings table:"
        @teams.each { |team| puts "Team #{team.name}: Total Points #{team.total_poins}, Goals in Favor #{team.goals_favor}, Goals Against #{team.goals_against}, Goals Difference #{team.goals_difference}"}
    end

    def add_team(name)
        @teams << Team.new(name)
    end

    def add_match(team_a, team_b, goals_team_a, goals_team_b)
        @matches << Match.new(team_a, team_b, goals_team_a, goals_team_b)
    end
end