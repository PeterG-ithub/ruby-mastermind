# frozen_string_literal: true

# Documentation:
class Game
  attr_accessor :code

  def generate_code
    arr = %w[r o y g b p]
    @code = [arr[rand(6)], arr[rand(6)], arr[rand(6)], arr[rand(6)]]
  end

  def hint_giver(guess)
    big_hint = 0
    small_hint = 0
    temp = guess.map(&:clone)
    @code.each_with_index do |val, idx|
      if val == temp[idx]
        big_hint += 1
        index = temp.find_index { |i| i == val }
        temp[index] = '0'
      elsif temp.include?(val)
        index = temp.find_index { |i| i == val }
        temp[index] = '0'
        small_hint += 1
      end
    end
    [big_hint, small_hint]
  end

  def start_game
    intro
    rules
    example
    game_selection(selection)
  end

  def game_selection(sel)
    codebreaker if sel == '1'
    codemaker if sel == '2'
  end

  def codebreaker
    codebreaker_msg
    generate_code
    codebreaker_start
  end

  def codebreaker_start
    board = Board.new
    for i in 0..9
      guess = input_valid(gets.chomp, %w[r o y g b p])
      big_hint, smol_hint = hint_giver(guess)
      board.draw(i, guess)
      board.draw_hint(i, big_hint, smol_hint)
      board.draw_board
      break if big_hint == 4

      puts 'Next guess: '
    end
    if big_hint == 4
      winner
    else
      loser
      draw_code
    end
  end

  def input_valid(string, arr)
    until string.split(' ').map { |val| arr.include?(val.first.downcase) }.all? && string.split(' ').count == 4
      puts 'Invalid input. Please try again: '
      puts 'Example guess: r r y b or red red yellow Blue'
      print ": Please use 4 words/letters: \n" if string.split(' ').count != 4
      string = gets.chomp
    end
    string.split(' ').map { |val| val.first.downcase }
  end

  def draw_code
    code = Board.new(1)
    code.draw(0, @code)
    code.draw_board
  end
end
