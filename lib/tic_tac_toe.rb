require 'pry'
class TicTacToe
    attr_accessor :board

    def initialize(board = [" "," "," "," "," "," "," "," "," "])
        @board = board
    end

  WIN_COMBINATIONS = [
        [0,1,2],
        [3,4,5],
        [6,7,8],
        [0,3,6],
        [1,4,7],
        [2,5,8],
        [0,4,8],
        [6,4,2]
    ]

    def display_board
       puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
       puts "-----------"
       puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
       puts "-----------"
       puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end

    def input_to_index(input)
        input.to_i - 1
    end

    def move(index, token="X")
        @board[index] = token
    end

    def position_taken?(index)
        if @board[index] == " "
            false
        else
            true
        end
    end

    def valid_move?(index)
        if index >= 0 && index < 9 && !position_taken?(index)
            true
        else
            false
        end
    end

    def turn_count
       9 - (@board.count {|play| play == " "})
    end

    def current_player
        if turn_count%2 == 0
            "X"
        else
            "O"
        end
    end

    def turn
    puts "What square do you want to play in?"
        input = (gets.chomp)
        index = input_to_index(input)
        if valid_move?(index)
            token = current_player
            move(index,token)   
        else
            
            turn
        end
        display_board
    end 

    def won?
      WIN_COMBINATIONS.find {
        |combo| 
      if  @board[combo[0]] == @board[combo[1]] && @board[combo[2]] == @board[combo[1]] && position_taken?(combo[0])
       combo 
      else
        false
      end 
    }       
    end

    

    def full?
        @board.all?{|box| box != " "} 
    end

    def draw?
        full? && !won?
    end

    def over?
        won? || draw?
    end

    def winner
       if combo = won?
         @board[combo[0]]
        else
            nil
        end
    end

    def play

        turn until over?

        if combo = won?
            winner
            puts "Congratulations #{winner}!"
        else
            puts "Cat's Game!"
        end
    end
#  binding.pry
end

