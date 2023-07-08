# frozen_string_literal: true

require_relative 'string'
require_relative 'messages'
require_relative 'board'
# puts '○◉●◌⬤    ◯'
intro
rules

board = Board.new
board.draw(0, %w[r o y p])
board.draw_hint(0, 1, 2)
