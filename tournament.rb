require './team.rb'
require './match.rb'
require './logging.rb'
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

end