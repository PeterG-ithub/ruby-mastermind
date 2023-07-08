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
    @code.each_with_index do |val, idx|
      big_hint += 1 if val == guess[idx]
      small_hint += 1 if val != guess[idx] && guess.include?(val)
    end
    [big_hint, small_hint]
  end

  def start_game
    intro
    rules
  end
end
