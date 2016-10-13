

 class Mastermind 
  
   def start_game
        puts "Welcome to Mastermind"
        while true do
            puts "Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
            print "> "
        
            input = gets.chomp

                
            if input == "play" || input == "p" 
                puts  "I have generated a beginner sequence with four elements made of(r)ed, (g)reen, (b)lue, and (y)ellow. Use (q)uit at any time to end the game. " 
    
                b = Beginner.new
                while true do
                    puts "What is your guess?"
            
                    print "> "
                    guess = gets.chomp
            
                    if guess == 'c' or guess == 'cheat'
                        puts b.characters 
                    else 
                        break if guess == 'q' || guess == 'quit' 
                        break if b.match(guess.upcase)
                    end
                end
            
            elsif  input == "i" || input == "instructions"
                puts " To play game type play or type p."
                puts "Guess a 4 letter color sequence to try to crack the code!"
            
            elsif input == "q" || input == "quit"
                puts "Goodbye, you are exiting the game!"
                break
            else 
                puts "You need to pick either q, p, or i!"    
            end 
        end
    end

end  

class Beginner
    attr_reader :characters
    def initialize
        colors = ["R","G","B","Y"]
        @characters = colors[rand(0..3)]+
                      colors[rand(0..3)]+
                      colors[rand(0..3)]+
                      colors[rand(0..3)]
        @number_of_guesses = 0

    end

    def match(guess)
        @number_of_guesses += 1
        number_of_correct_elements = 0
        number_of_correct_positions = 0

        if guess.length < 4
            puts "Guess is too short!"
        elsif guess.length > 4
            puts "Guess is too long!"
        elsif guess[0] == @characters[0] && guess[1] == @characters[1] && guess[2] == @characters[2] && guess[3] == @characters[3]
            
            puts "Congratulations!  You guessed the sequence #{@characters} in #{@number_of_guesses}"
            return true
        else
            0.upto(3) do |num|
                if guess[num] == @characters[num]
                    number_of_correct_positions += 1
                end
            
                    
                
            end
            @characters.split("").uniq.each do |c|
                if @characters.count(c) < guess.count(c)
                    number_of_correct_elements += @characters.count(c)
                elsif guess.count(c)>0
                    number_of_correct_elements += @characters.count(c) - guess.count(c)
                end
            end
            puts "'#{guess}' has #{number_of_correct_elements} of the correct elements with #{number_of_correct_positions} in the correct spot."
            puts "You've taken #{@number_of_guesses} guesses"
        end
        return false
    end
end







m = Mastermind.new
m.start_game