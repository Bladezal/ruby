require './team.rb'
require './logging.rb'
class Match
include Logging
    def initialize(team_a, team_b, goals_team_a, goals_team_b)
        @team_a = team_a
        @team_b = team_b
        @goals_team_a = goals_team_a
        @goals_team_b = goals_team_b
        log("Initializing Match #{team_a.name} X #{team_b.name}  Final Score: #{goals_team_b} - #{goals_team_a}",'DEBUG')
    end
    
    attr_accessor :team_a, :team_b, :goals_team_a, :goals_team_b

    def calc_points
        if @goals_team_a > @goals_team_b then
            @team_a.total_poins += 3
        elsif @goals_team_b > @goals_team_a then
            @team_b.total_poins += 3
        else
            @team_a.total_poins += 1
            @team_b.total_poins += 1
        end
        @team_a.goals_favor += @goals_team_a
        @team_b.goals_against += @goals_team_a
        @team_b.goals_favor += @goals_team_b
        @team_a.goals_against += @goals_team_b 
    end
end