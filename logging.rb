module Logging
    def log(message, level='INFO')
        raise ArgumentError, 'Available levels are: DEBUG, INFO, WARN, ERROR, FATAL.' unless ['DEBUG', 'INFO', 'WARN', 'ERROR', 'FATAL'].include? level
        puts "#{level}: #{message}"
    end
end