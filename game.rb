# frozen_string_literal: true

# Documentation:
class Game
  attr_accessor :code

  def generate_code
    arr = %w[r o y g b p]
    @code = [arr[rand(6)], arr[rand(6)], arr[rand(6)], arr[rand(6)]]
  end

  def hint_giver(guess, code = @code)
    big_hint = 0
    small_hint = 0
    clone_guess = guess.clone
    clone_code = code.clone
    clone_guess.reject!.with_index do |val, idx|
      big_hint += 1 if val == code[idx]
      val == code[idx]
    end
    clone_code.reject!.with_index { |val, idx| val == guess[idx] }
    clone_guess.each_with_index do |val, idx|
      next unless clone_code.include?(val)

      clone_code.slice!(clone_code.index(val))
      clone_guess[idx] = nil
      small_hint += 1
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

  def codemaker
    codemaker_msg
    @code = input_valid(gets.chomp, %w[r o y g b p])
    codemaker_algo
  end

  def codemaker_algo
    set = %w[r o y g b p].repeated_permutation(4).to_a
    guess = %w[r r o o]
    temp = []
    board = Board.new
    10.times do |i|
      system('clear')
      big_hint, smol_hint = hint_giver(guess)
      draw_code
      board.draw(i, guess)
      board.draw_hint(i, big_hint, smol_hint)
      board.draw_board
      set.each { |val| temp.push(val) if hint_giver(val, guess) == [big_hint, smol_hint] }
      set = temp
      temp = []
      guess = set[0]
      break if big_hint == 4

      thinking_animation(2)
    end
    algo_winner
  end

  def thinking_animation(duration)
    print 'thinking'
    sleep(1)  # Initial delay before starting animation
    duration.times do
      print '.'
      sleep(1)
    end
  end

  def codebreaker_start
    board = Board.new
    big_hint = 0
    10.times do |i|
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
      puts 'Colors: red orange yellow green blue purple'
      puts 'Example input: r r y b or red red yellow Blue'
      print ": Please use 4 words/letters: \n" if string.split(' ').count != 4
      string = gets.chomp
    end
    string.split(' ').map { |val| val.first.downcase }
  end

  def draw_code
    code = Board.new(1)
    code.draw(0, @code)
    puts 'Code'.bold.underline
    code.draw_board
  end
end
