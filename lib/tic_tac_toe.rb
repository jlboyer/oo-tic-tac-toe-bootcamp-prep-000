
class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end
  
  v1 = [0,3,6]
  v2 = [1,4,7]
  v3 = [2,5,8]
  h1 = [0,1,2]
  h2 = [3,4,5]
  h3 = [6,7,8]
  d1 = [0,4,8]
  d2 = [2,4,6]
  WIN_COMBINATIONS = [v1, v2, v3, h1, h2, h3, d1, d2]

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
  
  def move(index,character)
    @board[index] = character
  end
  
  def position_taken?
    if @board[@board.index] == " " || @board[@board.index] == "" || @board[@board.index] == nil
      false
    else
      true
    end
  end
  
  def valid_move?
    @board.index >= 0 && @board.index < 9 && !position_taken?
  end
  
  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    @board.input_to_index(input)
    if valid_move?
      move(@board.index, @board.current_player)
      @board.display_board
    else
      @board.turn
    end
  end 

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end
  
  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  def won?
    x_combo = []
    y_combo = []
    @board.each_with_index do |v, i|
      if v == "X"
        x_combo << i
      elsif v == "O"
        y_combo << i
      end
    end
    WIN_COMBINATIONS.each do |v|
      if (x_combo.include?(v[0]) && x_combo.include?(v[1]) && x_combo.include?(v[2])) || (y_combo.include?(v[0]) && y_combo.include?(v[1]) && y_combo.include?(v[2]))
        return v
      end
    end
    return false
  end

  def full?
    @board.all? do |i|
      if i == "X" || i == "O"
        true
      else
        false
      end
    end
  end
  
  def draw?
    !won? && full?
  end
  
  def over?
    if won? || draw? || full?
      true
    else
      false
    end
  end
  
  def winner
    combo = won?(board)
    if combo != false
      return board[combo[0]]
    else
      return nil
    end
  end
  
  def play(board)
    i = 0
    while i < 9 && over?(board) == false
      turn(board)
      i += 1
    end
    if draw?(board)
        puts "Cat\'s Game!"
    else
        puts "Congratulations #{winner(board)}!"
    end
  end


