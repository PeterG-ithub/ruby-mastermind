# frozen_string_literal: true

# Documentation:
class Board
  RED = '⬤'.red
  ORANGE = '⬤'.orange
  YELLOW = '⬤'.yellow
  PURPLE = '⬤'.magenta
  GREEN = '⬤'.green
  BLUE = '⬤'.blue
  BIGHINT = '●'.green
  SMOLHINT = '●'.blue

  attr_accessor :input

  def initialize(row = 10)
    @row = row
    @input = Array.new(row) { Array.new(8, '○') }
  end

  def draw_board(row = @row)
    top
    row -= 1
    row.times do |i|
      input_layer(i)
      mid
    end
    input_layer(row - 1)
    bot
  end

  def top
    puts ' ┏━━━━━━━━━━━━━┳━━━━━━━━━┓'
  end

  def input_layer(layer)
    puts " ┃ #{@input[layer][0]}  #{@input[layer][1]}  #{@input[layer][2]}  #{@input[layer][3]}"\
      "  ┃ #{@input[layer][4]} #{@input[layer][5]} #{@input[layer][6]} #{@input[layer][7]} ┃"
  end

  def mid
    puts ' ┣━━━━━━━━━━━━━╋━━━━━━━━━┫'
  end

  def bot
    puts ' ┗━━━━━━━━━━━━━┻━━━━━━━━━┛'
  end

  def draw(index, arr = Array.new(4))
    arr.map! { |string| string.first.downcase }
    color = {
      'b' => self.class::BLUE, 'r' => self.class::RED, 'g' => self.class::GREEN,
      'p' => self.class::PURPLE, 'y' => self.class::YELLOW, 'o' => self.class::ORANGE
    }
    arr.each_with_index { |col, idx| @input[index][idx] = color[col] }
  end

  # Based on number of big/smol hints
  def draw_hint(index, big_hint = 0, smol_hint = 0)
    num_of_hints = big_hint + smol_hint
    num_of_hints.times { @input[index].pop }
    big_hint.times { @input[index].push(self.class::BIGHINT) }
    smol_hint.times { @input[index].push(self.class::SMOLHINT) }
  end
end
