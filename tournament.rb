#Class Team 
class Team
    def name
        @name
    end

    def totalPoins
        @totalPoins
    end

    def goalsFavor
        @goalsFavor
    end

    def goalsAgainst
        @goalsAgainst
    end

    def goalsDifference
        @goalsDifference
    end    

    def initialize (name)
        @name=name
        @totalPoins=0
        @goalsFavor=0
        @goalsAgainst=0
        @goalsDifference=0
    end

    def name=(value)
        @name=value
    end
    
    def totalPoins=(value)
        @totalPoins=value
    end

    def goalsFavor=(value)
        @goalsFavor=value
    end

    def goalsAgainst=(value)
        @goalsAgainst=value
    end

    def calcDifference
        @goalsDifference = @goalsFavor - @goalsAgainst
    end
end

#Main
teams = Array[Team.new('A'), Team.new('B'), Team.new('C'), Team.new('D')]
puts teams.find_index {|t| t.name == 'A'}
puts "Please insert the matches results: "
for i in 1..6 do
    puts "Match number #{i}:"
    puts "Local team name: "
    teamA = gets.chomp
    loop do 
        if teams.any? {|t| t.name == teamA} then 
            break
        end
        puts "Invalid Team name. Try again"
        teamA = gets.chomp
    end
    puts "Visitor's name: "
    teamB = gets.chomp
    loop do 
        if teams.any? {|t| t.name == teamB} then
            break
        end
        puts "Invalid Team name. Try again"
        teamB = gets.chomp
    end
    puts "Score for Team #{teamA}: "
    scoreTeamA = gets.chomp.to_i
    puts "Score for Team #{teamB}: "
    scoreTeamB = gets.chomp.to_i
    if scoreTeamA > scoreTeamB then
        teams[teams.find_index {|t| t.name == teamA}].totalPoins += 3
    elsif scoreTeamB > scoreTeamA then
        teams[teams.find_index {|t| t.name == teamB}].totalPoins += 3
    else
        teams[teams.find_index {|t| t.name == teamA}].totalPoins += 1
        teams[teams.find_index {|t| t.name == teamB}].totalPoins += 1
    end
    teams[teams.find_index {|t| t.name ==teamA}].goalsFavor += scoreTeamA
    teams[teams.find_index {|t| t.name ==teamB}].goalsAgainst += scoreTeamA
    teams[teams.find_index {|t| t.name ==teamB}].goalsFavor += scoreTeamB
    teams[teams.find_index {|t| t.name ==teamA}].goalsAgainst += scoreTeamB
end
teams.each {|team| team.calcDifference}
teams = teams.sort_by {|t| t.totalPoins}.reverse
puts "Final Tournament standings table:"
teams.each { |team| puts "Team #{team.name}: Total Points #{team.totalPoins}, Goals in Favor #{team.goalsFavor}, Goals Against #{team.goalsAgainst}, Goals Difference #{team.goalsDifference}"}
