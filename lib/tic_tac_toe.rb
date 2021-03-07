class TicTacToe

    attr_accessor :board
    
    def initialize
        @board = Array.new(9, " ")
    end
    
    WIN_COMBINATIONS = [0,1,2], 
                       [3,4,5],
                       [6,7,8],
                        [0,3,6],
                        [1,4,7],
                        [2,5,8],
                        [0,4,8],
                        [6,4,2]

    def display_board
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts "-----------"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts "-----------"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end 

    def input_to_index(input)
        index = input.to_i - 1
    end

    def move(index, token = "X")
        @board[index] = token
    end

    def position_taken?(index)
        return false if @board[index] == " "
        return true
    end
    
    def valid_move?(index)
        return false if position_taken?(index) == true
        return false if index > 8 || index < 0
        return true
    end

    def turn_count
        @board.count{|token| token == "X" || token == "O"}
    end

    def current_player
        turn_count % 2 == 0 ? "X" : "O"
    end

    def turn
        puts "Please choose a position between 1 - 9."
        input = gets
        index = input_to_index(input)
        if valid_move?(index)
            token = current_player
            move(index, token)
            display_board
        else
            turn
        end
    end

    def won?
        WIN_COMBINATIONS.find do |combination| 
             combination.all? {|position| @board[position] == "X" } || 
             combination.all? {|position| @board[position] == "O"}
                
         end
     end

    def full?
        @board.all? { |space| space != " "}
    end

    def draw?
        full? && !won?
    end

    def over?
        won? || draw? 
    end

    def winner
        if won?
            index = won?[0]
            @board[index]
        else
            nil
        end
    end

    def play
        while !over?
            turn
        end
        if won?
            puts "Congratulations #{winner}!"
        elsif draw?
            puts "Cat's Game!"
        end
    end
    


end