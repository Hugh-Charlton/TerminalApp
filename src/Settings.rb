class Settings

    def initialize
        @timer = 60
        @points = 0
    end

    def s_menu

        loop do

            puts "Would you like to set the timer or set a point requirement for each round?".colorize(:light_blue)
            print "
Timer = "
print "#{@timer}s".colorize(:light_blue)
print " | Round Pass/Fail = "
puts "#{@points}
".colorize(:light_blue)

print "[1] ".colorize(:light_blue)
puts "Timer"
print "[2] ".colorize(:light_blue)
puts "Points"
puts "[0] Back".colorize(:red)

            s_input = gets.strip.downcase

            if s_input == "1" || s_input == "timer"
                system "clear"
                puts "What would you like to set the timer per question to be?"

                print "[1] ".colorize(:green)
                puts "Easy (60)"
                print "[2] ".colorize(:yellow)
                puts "Normal (45)"
                print "[3] ".colorize(:red)
                puts "Hard (30)"

                time = gets.strip.downcase

                # Timer difficulty selection
                
                if time == "1" || time == "easy"
                    @timer = 60
                elsif time == "2" || time == "normal"
                    @timer = 45
                elsif time == "3" || time == "hard"
                    @timer = 30
                else
                    puts "Invalid input"
                end

            elsif s_input == "2" || s_input == "points"
                system "clear"
                puts "what would you like to set the point threshold to per round?"

                puts "[1] Pointless"
                print "[2] ".colorize(:green)
                puts "Easy (20)"
                print "[3] ".colorize(:yellow)
                puts "Normal (50)"
                print "[4] ".colorize(:red)
                puts "Hard (70)"
                print "[5] ".colorize(:magenta)
                puts "Extreme (90)"

                diff = gets.strip.downcase

                # Pass/Fail difficulty selection

                if diff == "1" || diff == "pointless"
                    @points = 0
                elsif diff == "2" || diff == "easy"
                    @points = 20
                elsif diff == "3" || diff == "normal"
                    @points = 50
                elsif diff == "4" || diff == "hard"
                    @points = 70
                elsif diff == "5" || diff == "extreme"
                    @points = 90
                else
                    puts "Invalid input"
                end

            elsif s_input == "0" || s_input == "back"
                return
            else
                system "clear"
                puts "Invalid input please try again"
                sleep 2
            end

            system "clear"
        end

    end

end