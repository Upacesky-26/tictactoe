require 'pry'
# frozen_string_literal: true

# define the game behaviors

class Game
  attr_accessor :first_row, :second_row, :third_row, :turn_count, :current_player

  def initialize
    @board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    @turn_count = 0
    @current_player = current_player
  end

  WIN_COMBOS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]
  ].freeze

  def win?
    WIN_COMBOS.each do |combo|
      if @board.include?(combo)
        win = true # check if a winning combo is included in the board
      end
  end

  def draw_field
    puts "#{@board[0]} | #{@board[1]} | #{@board[2]}"
    puts "#{@board[3]} | #{@board[4]} | #{@board[5]}"
    puts "#{@board[6]} | #{@board[7]} | #{@board[8]}"
  end

  def endgame
    puts "Congratulation, #{current_player} wins!"
  end
end

# define the players
class Players < Game
  :sign

  def initialize(sign)
    @sign = sign
  end

  def your_turn?
    if @turn_count >= 9
      puts "All positions taken, no winner here..."
    end
    if @turn_count.even?
      current_player = player1
      player1.plays
    else
      current_player = player2
      player2.plays
    end
  end

  def player_input
    puts "#{current_player}, please input your coordinates with
    a number from 1 to 9"
    round = gets.chomp.input_check
  end

  def write_the_sign
    round.split.first
  end

  def write_error
    puts 'Someone already played there, please input again.'
  end

  def input_check
    input_error unless round.length == 1
  end

  def input_error
    puts '#{current_player}, your input is not a letter and a number,
    please input again'
  end

  def plays
    draw_field
    current_player.your_turn?
    # input coordinate
    @turn_count += 1
    win == "true" ? :endgame : your_turn? # checks if a player has won, else start a new turn
  end
end

game = Game.new
player1 = Players.new("X")
player2 = Players.new("0")
current_player = player1

binding.pry

player1.plays
