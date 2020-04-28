require_relative "Settings"

class Singleplayer < Settings 

    def initialize
        super
        @score = 0
        @total_score = 0
        @bonus_score = 0
        @continue = true
        @r1_score = 0
        @r2_score = 0
        @r3_score = 0
        @now = Time.now
        @end = Time.now
        @t_diff = 0
    end

    def start

        if @timer > 100
            @timer = 60
        end

       puts "--Welcome to Quizz Wizz--
        
Rules:
The game is broken up into different rounds, each round harder than the next.  There are 3 rounds and each round consists of at least 5 questions.
When the game begins you will be posed with a question, once an asnwer is given you move on the next question.  At the end of each round a prompt will show to signify the end of the round, pressing enter will move you to the next round if you pass.
You will be awarded points every time you answer correctly as well as bonus points for perfect rounds.
Depending on the chosen settings different ammounts of points/correct answer are required to move to the next round.
Any bonus point awarded will not contribute to your passing grade for the round.
Good Luck!".colorize(:light_blue)
print "
The current Question Timer is set to: "
puts "#{@timer}s".colorize(:green)
print "The current Round Passing Score is set to: "
puts "#{@points}".colorize(:green)
puts "
Are you ready to start?".colorize(:yellow)
print "[1] ".colorize(:green)
puts "Yes"
print "[2] ".colorize(:light_blue)
puts "Settings"
puts "[0] Back".colorize(:red)
    end

    def round_one
        @score = 0
        @now = Time.now

        # Timer per question converted to quiz length

        if @timer == 60
            @t_diff = 1
        elsif @timer == 45
            @t_diff = 2
        elsif @timer == 30
            @t_diff = 4
        else
            @t_diff = 0
        end

        @timer = @timer * 16

        system "clear"
        puts "What is the solution to the follow equation: ".colorize(:light_blue)
        puts "3 x 3 - 3 + 5 x 2 - 4 = 

[1] x = 22
[2] x = -10
[3] x = 18
[4] x = 12
[5] x = 17"

        one_answer_one = gets.strip.downcase

        if one_answer_one == "4" || one_answer_one == "12" || one_answer_one == "x = 12"
            @score += 20
        end

        system "clear"
        puts "What year did the first gold rush start in Australia?".colorize(:light_blue)
        puts "        
[1] 1851
[2] 1914
[3] 1872
[4] 1922"

        one_answer_two = gets.strip.downcase

        if one_answer_two == "1" || one_answer_two == "1851"
            @score += 20
        end

        system "clear"
        puts "Which of the following is not part of the water cycle?".colorize(:light_blue)
        puts "
[1] Condensation
[2] Precipition
[3] Evaporation
[4] Carbonation"

        one_answer_three = gets.strip.downcase

        if one_answer_three == "4" || one_answer_three == "Carbonation"
            @score += 20
        end

        system "clear"
        puts "Which definition best suits term metaphor?".colorize(:light_blue)
        puts "
[1] A comparison between one thing and another, typically for the purpose of explanation or clarification.
[2] A figure of speech in which a word or phrase is applied to an object or action to which it is not literally applicable.
[3] A word or phrase that means exactly or nearly the same as another word or phrase in the same language.
[4] A figure of speech involving the comparison of one thing with another thing of a different kind, used to make a description more emphatic or vivid"

        one_answer_four = gets.strip.downcase

        if one_answer_four == "3" || one_answer_four == "a figure of speech in which a word or phrase is applied to an object or action to which it is not literally applicable"
            @score += 20
        end

        system "clear"
        puts "What is Mount Kosciuszko's height?".colorize(:light_blue)
        puts "
[1] 1731 m
[2] 1.82 km
[3] 1.64 km
[4] 1754 m
[5] 2228 m"

        one_answer_five = gets.strip.downcase

        if one_answer_five == "5" || one_answer_five == "2228 m" || one_answer_five == "2228m" || one_answer_five == "2.228km" || one_answer_five == "2.228 km"
            @score += 20
        end

        system "clear"

        @r1_score = @score

        print "That is the end of "
        print "round one".colorize(:light_blue)
        print ", your score for that round was "

        # Pass Check Round 1

        if @r1_score >= @points
            puts "#{@score}".colorize(:green)
            puts "Well done! You passed."
            @continue = true
        else
            puts "#{@score}".colorize(:red)
            puts "Oh no you didn't score high enough for this round, sorry.  Better luck next time"
            @continue = false
        end
        
        if @r1_score == 100
            @bonus_score += 10
        end

        puts "press enter to continue".colorize(:yellow)
        r1_done = gets.strip.downcase

    end

    def round_two

        system "clear"

        if @continue == true

            puts "howe many erorrs are in this queston.?".colorize(:light_blue)

            two_answer_one = gets.strip.downcase

            if two_answer_one == "4" || two_answer_one == "four"
                @score += 20
            end

            system "clear"
            puts "What is the value of 'y' in the following equation: ".colorize(:light_blue)
            puts "10 x ((y) + 3) x (2 - 3) = 20"

            two_answer_two = gets.strip.downcase

            if two_answer_two.include?("-5") || two_answer_two == "negative 5"
                @score += 20
            end

            system "clear"
            puts "Which of the following is an example of Osmosis?".colorize(:light_blue)
            puts "
[1] Water transforming from between stages, water to ice.
[2] Ice that remains frozen above melting point diue to extreme preassure.
[3] Oxidation process of metals that do not rust, Titanium combusting.
[4] Dried fruit absorbing water."

            two_answer_three = gets.strip.downcase

            if two_answer_three == "4" || two_answer_three == "dried fruit absorbing water"
                @score += 20
            end

            system "clear"
            puts "If 3 lightbulbs are placed along a single circuit, what do you think makes the first bulb different from the last bulb when the power is turned on?".colorize(:light_blue)
            
            two_answer_four = gets.strip.downcase

            if two_answer_four.include?("bright")
                @score += 20
            end

            system "clear"
            puts "You come across a car crash, a man is lying down on the road unconscious.  According to DRABCD what is your first action?".colorize(:light_blue)
            puts "
[1] Try to carefully remove the man from the road and away from the crash and/or remove anything harmful from the surrounds.
[2] Check for breathing, a pulse or if their airway is clear.
[3] Shift their body into the recovery position, to try to slow some bleeding.
[4] Do not move him to avoid potential harm to his spine, and check for any responses to sight, sound or touch.
[5] Start compressions."

            two_answer_five = gets.strip.downcase

            if two_answer_five == "1" || two_answer_five == "try to carefully remove the man from the roadand away from the crash"
                @score += 20
            end

            system "clear"

            @r2_score = @score - @r1_score

            print "That is the end of "
            print "round two".colorize(:light_blue)
            print ", your score for that round was "

            # Pass Check Round 2

            if @r2_score >= @points
                puts "#{@r2_score}".colorize(:green)
                puts "Well done you passed this round too!"
            else
                puts "#{@r2_score}".colorize(:red)
                puts "Oh no you didn't score high enough for this round, sorry.  Better luck next time"
                @continue = false
            end

            if @r2_score == 100
                @bonus_score += 25
            end

            puts "press enter to continue".colorize(:yellow)
            r2_done = gets.strip.downcase
    
        end
    end

    def round_three

        if @continue == true

            system "clear"
            puts "The peppered moth which can be found throughout Euraisa is a species of moth that can be white or black.
During and after the indutrial revolution one of these colourations became far more common than the other, what do you think is the reason for this?".colorize(:light_blue)        
            puts "
[1] The species moved across country to more lush forests due to deforestation.
[2] Polution blackened the tree bark causing the black colouration to be more common as its camouflage was more effective.
[3] The species was wiped out due to pollution and deforestation.
[4] Moth populations boomed due a rising silk industry.  The moth was farmed for its silk"

            three_answer_one = gets.strip.downcase

            if three_answer_one == "2" || three_answer_one == "polution blackened the tree bark causing the black colouration to be more common as its camouflage was more effective"
                @score += 20
                @bonus_score += 5
            end

            system "clear"
            puts "What is the answer to the following riddle:
I am not alive, but I grow; I don't have lungs, but I need air; I don't have a mouth, but water kills me. What am I?".colorize(:light_blue)

            three_answer_two = gets.strip.downcase

            system "clear"

            if three_answer_two == "fire" || three_answer_two == "a fire"
                @score += 20
                @bonus_score += 5
            else
                print "would you like try that question again? ".colorize(:light_blue)
                puts "(-10 points, comes with a hint)".colorize(:red)
                response = gets.strip.downcase
            end

            system "clear"

            if response == "yes" || response == "y"
                @score -= 10
                puts "What is the answer to the following riddle:
I am not alive, but I grow; I don't have lungs, but I need air; I don't have a mouth, but water kills me. What am I?".colorize(:light_blue)
                puts "
Hint: I am one of the four elements of nature.".colorize(:yellow)

                three_answer_two_h = gets.strip.downcase

                if three_answer_two_h == "fire" || three_answer_two_h == "a fire"
                    @score += 20
                end
            end

            system "clear"
            puts "The life cycle of the butterfly has how many clear stages?".colorize(:light_blue)

            three_answer_three = gets.strip.downcase
            full_marks = 0

            if three_answer_three == "4" || three_answer_three == "four"
                @score += 5
                system "clear"
                puts "Can you name these stages in order?
The first stage is called: ".colorize(:light_blue)

                part1 = gets.strip.downcase

                if part1.include?("egg")
                    @score += 5
                    puts "What strategy do most butterflies use when laying eggs to increase survivability of their next generation?".colorize(:light_blue)
                    puts "
[1] They hide their eggs and wrap them in a protective cocoon.
[2] They use pheromones to fool other species into protecdting their eggs.
[3] They lay large quantities of eggs"

                    part1_one = gets.strip.downcase

                    if part1_one == "3" || part1_one == "they lay large quantities of eggs"
                        @score += 5
                        full_marks += 1
                    end
                end

                system "clear"

                puts "The seond stage is called: ".colorize(:light_blue)

                part2 = gets.strip.downcase

                if part2.include?("larva") || part2.include?("feed") || part2.include?("caterpillar")
                    @score += 5
                    puts "What do you think is the caterpillar's main goal?".colorize(:light_blue)

                    part2_one = gets.strip.downcase

                    if part2_one.include?("eat") || part2_one.include?("energy") || part2_one.include?("grow") || part2_one.include?("consume")
                        @score += 5
                        full_marks += 1
                    end
                end

                system "clear"

                puts "The third stage is called: ".colorize(:light_blue)

                part3 = gets.strip.downcase

                if part3.include?("pupa") || part3.include?("transition")
                    @score += 5
                    puts "What do you think happens if a caterpiller doesn't pupate?".colorize(:light_blue)

                    part3_one = gets.strip.downcase

                    if part3_one.include?("dehydrate") || part3_one.include?("dehydration") || part3_one.include?("exhaust")
                        @score += 10
                        full_marks += 1
                    elsif part3_one.include?("die") || part3_one.include?("death")
                        @score += 5
                        full_marks += 1
                    end
                end

                system "clear"

                puts "The fourth stage is called: ".colorize(:light_blue)

                part4 = gets.strip.downcase

                if part4.include?("adult") || part4.include?("reproduc")
                    @score += 5
                    puts "What do you think the pattern on butterfly wings is used for?".colorize(:light_blue)

                    part4_one = gets.strip.downcase

                    if part4_one.include?("camouflage")
                        @score += 10
                        full_marks += 1
                    end
                end

                if full_marks == 4
                    @bonus_score += 10
                end
            end

            @end = Time.now - @now
            @end = @end.to_i

            system "clear"

            @r3_score = @score - @r2_score - @r1_score

            print "That is the end of "
            print "round three".colorize(:light_blue)
            print ", your score for that round was "

            # Pass Check Round 3

            if @r3_score >= @points
                puts "#{@r3_score}".colorize(:green)
                puts "Well done you passed this round too!"
            else
                puts "#{@r3_score}".colorize(:red)
                puts "Oh no you didn't score high enough for this round, sorry.  Better luck next time"
                @continue = false
            end

            # Timer Check

            if @timer >= @end 
                @bonus_score += (10 * @t_diff)
            else
                @continue = false
            end

            if @r3_score == 100
                @bonus_score += 35
            end

            # Difficulty Bonus

            case @points
            when 20
                @bonus_score += 5
            when 50
                @bonus_score += 20
            when 70
                @bonus_score += 35
            when 90
                @bonus_score += 50
            end

            puts "press enter to continue".colorize(:yellow)
            r3_done = gets.strip.downcase

        end
    end

    def score_screen
        puts "Well done, your scores are as follows: "

        # Score checking and calculation

        @end = @end.to_i

        if @timer >= @end && @continue == true
            puts "You beat the quiz in the allotted time and recieve bonus points"
        else
            puts "Sorry you did not beat the quiz in the allotted time"
        end

        if @r1_score >= @points
            puts "well done you passed Round 1".colorize(:green)
        end

        print "Round 1: "
        puts "#{@r1_score}".colorize(:light_blue)

        if @r2_score >= @points
            puts "well done you passed Round 2".colorize(:green)
        end

        print "Round 2: "
        puts "#{@r2_score}".colorize(:light_blue)

        if @r3_score >= @points
            puts "well done you passed Round 3".colorize(:green)
        end

        print "Round 3: "
        puts "#{@r3_score}".colorize(:light_blue)
        print "Points for correct answers: "
        puts "#{@score}".colorize(:light_blue)
        print "Bonus points for perfect rounds and difficulty: "
        puts "#{@bonus_score}".colorize(:light_blue)
        print "Your total score is: "
        puts "#{@score + @bonus_score}".colorize(:light_blue)

        # Write Passing scores to Highscores.txt

        if @continue == true
            puts "Please enter your name..."
            name = gets.strip.capitalize
            File.write("Highscores.txt", "Quiz Wiz --- Name: #{name} --- Score: #{@score}\n", mode: "a")
        end

        puts "press enter to return to start".colorize(:yellow)
        done = gets.strip.downcase

    end
end