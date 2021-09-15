# Class Temperature Converter
class TemperatureConverter
    
    def initialize()
    end
    
    def to_fahrenheit(temp)
        return (temp * 9/5) + 32
    end

    def to_celsius(temp)
        return (temp - 32) * 5/9
    end
end

# main program
puts "Temperature Converter"
option = 3
converter = TemperatureConverter.new()
while option != 0
    puts "Select conversion Celsius to Fahrenheit(1), Fahrenheit to Celsius(2) or End(0): "
    option = gets.chomp
    break if option == "0"
    if option.to_i > 2 then
        puts "Wrong Option."
    else
        puts "Input temperature: "
        temp = gets.chomp
        result = case option.to_i
        when 1 then converter.to_fahrenheit(temp.to_f)
        when 2 then converter.to_celsius(temp.to_f)
        end
        puts "Conversion result: #{result}"        
    end
end

