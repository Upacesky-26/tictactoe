class Player
  def initialize(name)
    @name = name
    @games_won = games_won
  end
  def plays

  end
end

class Game
  attr_accessor :first_row :second_row :third_row
  def initialize
  first_row = ['-', '-', '-']
  second_row = ['-', '-', '-']
  third_row = ['-', '-', '-']
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
    else
      
    end
  end
  public
  def draw_field
    puts "A" + first_row
    puts "B" + second_row
    puts "C" + third_row
  end
  draw_field
end
