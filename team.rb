class Team
    attr_accessor :name, :total_poins, :goals_against, :goals_difference, :goals_favor    

    def initialize (name)
        @name=name
        @total_poins=0
        @goals_favor=0
        @goals_against=0
        @goals_difference=0
    end

    def calc_difference
        @goals_difference = @goals_favor - @goals_against
    end
end