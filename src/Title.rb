require_relative "Singleplayer.rb"
require_relative "Settings.rb"

require "colorize"

singleplayer = Singleplayer.new

# Checking for command line arguements

if ARGV[0] == "cheat"
    cheating = true
else
    cheating = false
end

ARGV.clear

# Changes the current directory to where Title.rb is located
Dir.chdir(File.dirname(__FILE__))

loop do

    puts "

     /$$$$$$            /$$                 /$$      /$$ /$$          
    /$$__  $$          |__/                | $$  /$ | $$|__/          
   | $$  \\ $$ /$$   /$$ /$$ /$$$$$$$$      | $$ /$$$| $$ /$$ /$$$$$$$$
   | $$  | $$| $$  | $$| $$|____ /$$/      | $$/$$ $$ $$| $$|____ /$$/
   | $$  | $$| $$  | $$| $$   /$$$$/       | $$$$_  $$$$| $$   /$$$$/ 
   | $$/$$ $$| $$  | $$| $$  /$$__/        | $$$/ \\  $$$| $$  /$$__/  
   |  $$$$$$/|  $$$$$$/| $$ /$$$$$$$$      | $$/   \\  $$| $$ /$$$$$$$$
    \\____ $$$ \\______/ |__/|________/      |__/     \\__/|__/|________/
         \\__/                                                         
                                                                      
                                                                       
".colorize(:magenta) 
puts "Would you like to play?".colorize(:yellow)
print "[1] ".colorize(:green)
puts "Quiz"
print "[2] ".colorize(:light_blue) 
puts "Highscores"

if cheating == true
    print "[3] ".colorize(:magenta)
    puts "Cheatsheet"
end

puts "[0] Quit".colorize(:red)

    input = gets.strip.downcase

    if input == "1" || input == "quiz"
        system "clear"

        loop do

            singleplayer.start
            s_input = gets.strip.downcase

            # Singleplayer Menus
            
            if s_input == "1" || s_input == "yes"
                system "clear"
                singleplayer.round_one
                singleplayer.round_two
                singleplayer.round_three
                singleplayer.score_screen
                system "clear"
            elsif s_input == "2" || s_input == "settings"
                system "clear"
                singleplayer.s_menu
                system "clear"
            elsif s_input == "0" || s_input == "back" || s_input == "no"
                system "clear"
                break
            else
                puts "Invalid input please try again"
                sleep 2
                system "clear"
            end
        end

        # Highscore, read line by line

        system "clear"
    elsif input == "2" || input == "competition mode"
        system "clear"
        File.foreach("Highscores.txt") { |line| puts line }
        puts "press enter to return to start".colorize(:yellow)
        done = gets.strip.downcase
        system "clear"
    elsif input == "0" || input == "quit"
        system "clear"
        return

        # Cheetsheet

     elsif input == "3" && cheating == true
        system "clear"
        file = File.open("Cheatsheet.txt")
        file_data = file.readlines.map(&:chomp)
        puts file_data
        puts "press enter to return to start".colorize(:yellow)
        done = gets.strip.downcase
        system "clear"
        file.close
    else
        puts "invalid input please try again"
        sleep 2
        system "clear"
    end

end