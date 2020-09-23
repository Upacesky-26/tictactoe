require 'pry'
# frozen_string_literal: true

# define the game behaviors

class Game
  attr_accessor :first_row, :second_row, :third_row, :turn_count, :current_player

  def initialize
    @first_row = ['-', '-', '-']
    @second_row = ['-', '-', '-']
    @third_row = ['-', '-', '-']
    @turn_count = 0
    @current_player = current_player
  end

  def win?
    case test
    when @first_row.uniq.count <= 1
      'true'
    when @second_row.uniq.count <= 1
      'true'
    when @third_row.uniq.count <= 1
      'true'
    when (@first_row[0] && @second_row[1] && @third_row[2]).uniq.count <= 1
      'true'
    when (@first_row[2] && @second_row[1] && @third_row[0]).uniq.count <= 1
      'true'
    end
  end

  def draw_field
    puts "A " + @first_row.to_s
    puts "B " + @second_row.to_s
    puts "C " + @third_row.to_s
  end

  def endgame
    puts "Congratulation, #{current_player} wins!"
  end
end

# define the players
class Players < Game
  attr_reader :player1, :player2, :sign

  def initialize(sign)
    @player1 = player1
    @player2 = player2
    @sign = sign
  end

  def your_turn?
    if turn_count.even?
      current_player = player1
      player1.plays
    else
      current_player = player2
      player2.plays
    end
  end

  def player_input
    puts "#{current_player}, please input your coordonates with
    a letter (A, B or C) and a number (1, 2 or 3)"
    round = gets.chomp.to_s.input_check
  end

  def write_the_sign

  end

  def write_error
    puts 'Someone already played there, please input again.'
  end

  def input_check
    # round.to_i.length != 2 ? :input_error
    input_error unless round.match?(/\AA|B|C/i) # checks if input matches letter
    input_error unless round.match?(/1|2|3\z/) # checks if last input character matches 1,2 or 3
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

binding.pry

player1.plays
