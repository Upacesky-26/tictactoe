# define the game behaviors
class Game
  attr_accessor :first_row, :second_row, :third_row

  def initialize
    @first_row = ['-', '-', "-"]
    @second_row = ['-', '-', "-"]
    @third_row = ['-', '-', "-"]
    @turn_count = 0
  end

  def win?
    case test
    when first_row.uniq.count <= 1
      'true'
    when second_row.uniq.count <= 1
      'true'
    when third_row.uniq.count <= 1
      'true'
    when (first_row[0] && second_row[1] && third_row[2]).uniq.count <= 1
      'true'
    when (first_row[2] && second_row[1] && third_row[0]).uniq.count <= 1
      'true'
    end
  end

  def draw_field
    puts "A" + @first_row
    puts "B" + @second_row
    puts "C" + @third_row
  end
  def endgame
    puts "Congratulation, #{current_player} wins!"
  end
end

# define the players
class Player < Game
  def initialize
    @player1 = player1
    @player2 = player2
  end

  def your_turn?
    if turn_count % 2 = 0
      current_player = player1
      player1.plays
    else
      current_player = player2
      player2.plays
    end
  end
  def player_input
    current_player = player1 ? sign = "X" : sign = "0"
  end

  def plays
    draw_field
    # choose player
    # input coordinate
    @turn_count =+ 1
    win = "true" ? :endgame : your_turn? # checks if a player has won, else start a new turn
  end
  
end
current_player.plays