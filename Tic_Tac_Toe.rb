opening = puts "Let's play some Tic-Tac-Toe! The board positions are: Top Left = 1, Top Middle = 2,Top Right = 3, Middle Left = 4, Middle Middle = 5, Middle Right = 6, Bottom Left = 7, Bottom Middle = 8, Bottom Right = 9. To start game type game_1 = TicTacToe.new(\"name of player 1\", \"name of player 2\"). Then type game_1.start. if you would like to play against the computer type game_1 = ComputerPlaysToo.new(\"name of player 1\"). Then type game_1.start_game. When in the game you will be asked to pick a spot, just type a number corresponding to an open spot on the board and press enter. Goof luck, and have fun! \n\n"


class TicTacToe

  # The hash that acts as our Tic-Tac-Toe board
  @@board = {1 => "open", 2 => "open", 3 => "open", 4 => "open", 5 => "open", 6 => "open", 7 => "open", 8 => "open", 9 => "open"}
  attr_accessor :choice, :player1, :player2

  # The initialize method that lets the two players give themselves names
  def initialize(player1 = "Player 1", player2 = "Player 2")
    @player1 = player1
    @player2 = player2
  end

 # The main method for the game 
def start_game
  
 # A loop that keeps the game going until either side gets one of 8 win conditions or the board get completely filled up with x's and o's.
    until @@board.values_at(1 ,2 ,3) == ["x","x","x"] || @@board.values_at(1 ,4 ,7) == ["x","x","x"] || @@board.values_at(1,5,9) == ["x","x","x"] || 
      @@board.values_at(2,5,8) == ["x","x","x"] || @@board.values_at(3,6,9) == 
      ["x","x","x"] || @@board.values_at(4,5,6) == ["x","x","x"] || @@board.values_at(7,8,9) == ["x","x","x"] || @@board.values_at(3,5,7) == ["x","x","x"] || @@board.values_at(1,2,3) == ["o","o","o"] || @@board.values_at(1,4,7) == ["o","o","o"] || @@board.values_at(1,5,9) == ["o","o","o"] || @@board.values_at(2,5,8) == ["o","o","o"] || @@board.values_at(3,6,9) == ["o","o","o"] || @@board.values_at(4,5,6) == ["o","o","o"] || @@board.values_at(7,8,9) == ["o","o","o"] || @@board.values_at(3,5,7) == ["o","o","o"] || !@@board.value?("open")
      
  # Shows the board and directs the player to pick a spot. it then collects this choice in the choice variable.
      puts @@board
      puts "\n#{@player1} You're up! Pick a spot: "
      choice = gets.chomp.to_i
      
  # Some conditional logic so that the player has to input a number between 1 and 9 and the number has to corespond to an open spot on the board. The player only gets one shot or they forfeittheir turn. If the player inputs a useable number it is placed on the board.
      if choice <= 9 && choice >= 1 && @@board[choice] == "open"
      @@board[choice] = "x"
      puts @@board
        
      else
      puts "\nPlease type a number that coresponds to an open spot"
      choice = gets.chomp.to_i
      @@board[choice] = "x"
      puts @@board
      end

  # A next keyword to skip the rest of the round and end the loop early. This will occur in the case that player 1 wins after their pick or the board becomes full
       next if !@@board.value?("open") || @@board.values_at(1 ,2 ,3) == ["x","x", "x"] || @@board.values_at(1 ,4 ,7) == ["x","x","x"] || @@board.values_at(1,5,9) == ["x","x","x"] || @@board.values_at(2,5,8) == ["x","x","x"] ||@@board.values_at(3,6,9) == ["x","x","x"] || @@board.values_at(4,5,6) == ["x","x","x"] || @@board.values_at(7,8,9) == ["x","x","x"] 
       
      puts "\n#{@player2} You're up! Pick a spot: "
      choice = gets.chomp.to_i
     
  # Some conditional logic so that the player has to input a number between 1 and 9 and the number has to corespond to an open spot on the board. The player only gets one shot or they forfeittheir turn. If the player inputs a useable number it is placed on the board with either an x or an o.
     if choice <= 9 && choice >= 1 && @@board[choice] == "open"
      @@board[choice] = "o"
      
        else
          puts "\nPlease type a number that coresponds to an open spot"
        choice = gets.chomp.to_i
        @@board[choice] = "o"
      end
    end

  # Once the loop ends that means that someone has won the game or a tie has occured. This code figures out who won and asks if they would like to play again.
    if @@board.values_at(1 ,2 ,3) == ["x","x","x"] || @@board.values_at(1 ,4 ,7)   == ["x","x","x"] || @@board.values_at(1,5,9) == ["x","x","x"] || 
      @@board.values_at(2,5,8) == ["x","x","x"] || @@board.values_at(3,6,9) == 
      ["x","x","x"] || @@board.values_at(4,5,6) == ["x","x","x"] || @@board.values_at(7,8,9) == ["x","x","x"] || @@board.values_at(3,5,7) == ["x","x","x"]
      puts "\nCongratulations, #{@player1}! You won! Do you want to play again?(Yes/No)"
      rematch = gets.chomp.downcase
    
    elsif @@board.values_at(1,2,3) == ["o","o","o"] || @@board.values_at(1,4,7) == ["o","o","o"] || @@board.values_at(1,5,9) == ["o","o","o"] || @@board.values_at(2,5,8) == ["o","o","o"] || @@board.values_at(3,6,9) == ["o","o","o"] || @@board.values_at(4,5,6) == ["o","o","o"] || @@board.values_at(7,8,9) == ["o","o","o"] || @@board.values_at(3,5,7) == ["o","o","o"]
      puts "\nCongratulations, #{@player2}! You won! Do you want to play again?(Yes/No)"
    rematch = gets.chomp.downcase

    elsif !@@board.value?("open")
      puts "\nOops looks like this game ends in a draw. Want to play again?(Yes/No)"
    rematch = gets.chomp.downcase
    end
  
  #Resets the board back to its original state so it can be ready for the next game.   
    @@board = {1 => "open", 2 => "open", 3 => "open", 4 => "open", 5 => "open", 6 => "open", 7 => "open", 8 => "open", 9 => "open"}
     
  #Begins a new game witht he same player names if the user answers yes to  a rematch.
    if rematch == "yes"
      game_1 = TicTacToe.new("#{@player1}","#{@player2}")
    game_1.start_game
  end
    end
  end

  class ComputerPlaysToo 
    
  # The fresh board and an array containing the spots the computer can choose from. @@computer_names is just a list of pop culture computers that the computer might be named.
    @@board = {1 => "open", 2 => "open", 3 => "open", 4 => "open", 5 => "open", 6 => "open", 7 => "open", 8 => "open", 9 => "open"}
    @@computer_choices = [1,2,3,4,5,6,7,8,9]
    @@computer_names = ["Hal", "Kit", "Bat-Computer", "Karen", "NICOLE", "Glados", "Bishop", "Cortana", "Guilty Spark", "John Henry Eden", "ADA", "Dummy Plug", "Shodan", "Jarvis", "The Magi", "Sigma", "SARA", "Lappy-486"]
    @@computer = @@computer_names.sample
    @@first_turn = true
    attr_accessor :choice, :player1  

  # The method that initializes the game. It only asks for the players name as the computer name is chosen randomly from the @@computer_names array.
  def initialize(player1 = "Player 1")
    @player1 = player1
    
  end

  def start_game

  # A loop that keeps the game going until either side gets one of 8 win conditions or the board get completely filled up with x's and o's.
    until @@board.values_at(1 ,2 ,3) == ["x","x","x"] || @@board.values_at(1 ,4 ,7) == ["x","x","x"] || @@board.values_at(1,5,9) == ["x","x","x"] || 
      @@board.values_at(2,5,8) == ["x","x","x"] || @@board.values_at(3,6,9) == 
      ["x","x","x"] || @@board.values_at(4,5,6) == ["x","x","x"] || @@board.values_at(7,8,9) == ["x","x","x"] || @@board.values_at(3,5,7) == ["x","x","x"] || @@board.values_at(1,2,3) == ["o","o","o"] || @@board.values_at(1,4,7) == ["o","o","o"] || @@board.values_at(1,5,9) == ["o","o","o"] || @@board.values_at(2,5,8) == ["o","o","o"] || @@board.values_at(3,6,9) == ["o","o","o"] || @@board.values_at(4,5,6) == ["o","o","o"] || @@board.values_at(7,8,9) == ["o","o","o"] || @@board.values_at(3,5,7) == ["o","o","o"] || !@@board.value?("open")

  # Shows the board and directs the player to pick a spot. it then collects this choice in the choice variable.
      puts @@board
      puts "\n#{@player1} You're up! Pick a spot: "
      choice = gets.chomp.to_i
      
  # Some conditional logic so that the player has to input a number between 1 and 9 and the number has to corespond to an open spot on the board. The player only gets one shot or they forfeittheir turn. If the player inputs a useable number it is placed on the board. the chosen spot is deleted from the computers options so that it doesn't accidentally pick an occupied spot.
      if choice <= 9 && choice >= 1 && @@board[choice] == "open"
      @@board[choice] = "x"
      puts @@board
      @@computer_choices.delete(choice)
      else
      puts "\nPlease type a number that coresponds to an open spot"
      choice = gets.chomp.to_i
      @@board[choice] = "x"
      puts @@board
     @@computer_choices.delete(choice)  
    end

  # A next keyword to skip the rest of the round and end the loop early. This will occur in the case that player 1 wins after their pick or the board becomes full
     next if !@@board.value?("open") || @@board.values_at(1 ,2 ,3) == ["x","x", "x"] || @@board.values_at(1 ,4 ,7) == ["x","x","x"] || @@board.values_at(1,5,9) == ["x","x","x"] || @@board.values_at(2,5,8) == ["x","x","x"] ||@@board.values_at(3,6,9) == ["x","x","x"] || @@board.values_at(4,5,6) == ["x","x","x"] || @@board.values_at(7,8,9) == ["x","x","x"]
      
  # Asks the computer to pick a spot.  gave the computer a little help by giving it spots it should pick based on the players first turn. After the first turn a random number is chosen from what is left of it's choices. The player is then shown what the computer picked and the loop resets.  
      puts "\n#{@@computer} You're up! Pick a spot: "
   
      if choice == 5 && @@first_turn == true 
  computer_choice = [1,3,7,9].sample
  @@computer_choices.delete(computer_choice)
  @@first_turn == false
  
 elsif choice == 1 || choice == 3 || choice == 7 || choice == 9 && @@first_turn == true 
  computer_choice = 5
  @@computer_choices.delete(computer_choice)
  @@first_turn == false
  
 elsif choice == 2 || choice == 4 || choice == 6 || choice == 8 && @@first_turn == true
  computer_choice = [1,3,5,7,9].sample
  @@computer_choices.delete(computer_choice)
  @@first_turn == false
  
 else 
  computer_choice == @@computer_choices.sample
  @@computer_choices.delete(computer_choice)
end
 
  # A loop to ensure that the computer will always pick a spot on the board that has not been picked. I guess .delete(computer_choice) should do this too but this makes extra sure.
      until @@board[computer_choice] == "open"
      computer_choice = @@computer_choices.sample
     end
      
     @@board[computer_choice] = "o"
      puts "\n#{@@computer} picked:\n#{computer_choice}"
    end
  
  # When the loop ends a winner/tie is declared. The player is then given an option to have a rematch.
   if @@board.values_at(1 ,2 ,3) == ["x","x","x"] || @@board.values_at(1 ,4 ,7)   == ["x","x","x"] || @@board.values_at(1,5,9) == ["x","x","x"] || 
      @@board.values_at(2,5,8) == ["x","x","x"] || @@board.values_at(3,6,9) == 
      ["x","x","x"] || @@board.values_at(4,5,6) == ["x","x","x"] || @@board.values_at(7,8,9) == ["x","x","x"] || @@board.values_at(3,5,7) == ["x","x","x"]
      puts "\nCongratulations, #{@player1}! You won! Do you want to play again?(Yes/No)"
      rematch = gets.chomp.downcase
    
    elsif @@board.values_at(1,2,3) == ["o","o","o"] || @@board.values_at(1,4,7) == ["o","o","o"] || @@board.values_at(1,5,9) == ["o","o","o"] || @@board.values_at(2,5,8) == ["o","o","o"] || @@board.values_at(3,6,9) == ["o","o","o"] || @@board.values_at(4,5,6) == ["o","o","o"] || @@board.values_at(7,8,9) == ["o","o","o"] || @@board.values_at(3,5,7) == ["o","o","o"]
      puts "\nCongratulations, #{@@computer}! You won! I guess humanity is doomed huh. Care for a chance to redeem the human race?(Yes/No)"
    rematch = gets.chomp.downcase

    elsif !@@board.value?("open")
      puts "\nOops looks like this game ends in a draw. Want to play again?(Yes/No)"
    rematch = gets.chomp.downcase
    end
  
  #Resets the board, computer choices, and first turn back to its original state so it can be ready for the next game.   
    @@board = {1 => "open", 2 => "open", 3 => "open", 4 => "open", 5 => "open", 6 => "open", 7 => "open", 8 => "open", 9 => "open"}
    @@computer_choices = [1,2,3,4,5,6,7,8,9]
    @@first_turn = true
  #Begins a new game witht he same player names if the user answers yes to  a rematch.
    if rematch == "yes"
      game_1 = ComputerPlaysToo.new("#{@player1}")
    game_1.start_game
  end
    end
  end

#game_1 = ComputerPlaysToo.new()
#game_1.start_game
  
game_1 = TicTacToe.new()
game_1.start_game