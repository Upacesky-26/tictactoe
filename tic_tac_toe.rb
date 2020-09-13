class Player
  def initialize(name)
    @name = name
    @games_won = games_won
  end
  def plays

  end
end

class Game
  def win?
    case test
    when first_row.uniq.count <= 1
      
    when second_row.uniq.count <= 1
      
    when third_row.uniq.count <= 1

    when 
    else 
      
    end
  end

  def draw_field
    first_row = ['-', '-', '-']
    second_row = ['-', '-', '-']
    third_row = ['-', '-', '-']
    puts "A" + first_row
    puts "B" + second_row
    puts "C" + third_row
  end
  draw_field
end
