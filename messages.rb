# frozen_string_literal: true

def intro
  puts 'Mastermind'.bold.underline
  puts ''
  puts 'Description:'.bold.underline
  puts 'Mastermind is a classic board game that challenges '\
   'players to crack a hidden code within 10 attempts.'
  puts "One player takes on the role of the #{'CODEMAKER'.green.bold}"
  puts "One player takes on the role of the #{'CODEBREAKER'.red.bold}"
  puts ''
end

def rules
  puts 'Rules'.bold.underline
  puts ''
  puts "The #{'CODEMAKER'.green.bold} #{'creates'.bold} a secret code by selecting a "\
    'sequence of colored circles.'
  puts "The #{'CODEBREAKER\'s'.red.bold} objective is to #{'guess'.bold} the secret code"\
    ' within 10 attempts.'
  puts 'After each guess, the code maker provides feedback to the code breaker.'\
    ' The feedback consists of green and white small circle.'
  puts "  #{'Green'.green.bold} circle #{'●'.green} : Indicates the number of"\
    " circle that are the #{'correct'.green.bold} color"\
    " and in the #{'correct'.green.bold} position."
  puts "  #{'White'.bold} circle ● : Indicates the number of"\
    " circle that are the #{'correct'.green.bold} color"\
    " but in the #{'wrong'.red.bold} position."
  puts 'The code maker does not reveal which specific pegs in the guess'\
    ' are correct; they only provide the total count of black and white pegs.'
  puts 'The code breaker uses the feedback to deduce the correct code.'\
    ' They can use logical reasoning and elimination '\
    'to narrow down the possibilities.'
  puts 'The game continues with the code breaker making'\
  ' subsequent guesses and the code maker providing feedback until:'

  puts '  The code breaker correctly guesses the secret code, '\
    "in which case they #{'win'.green.bold} the game."
  puts '  The code breaker runs out of attempts without cracking'\
    " the code, resulting in a #{'lose'.red.bold}."
end

def example
  puts ''
  puts 'Example'.bold.underline
  puts ''
  puts 'Code'.bold
  code = Board.new(1)
  code.draw(0, %w[r g b o])
  code.draw_board
  puts ''
  puts 'Guess'.bold
  guess = Board.new
  # Hardcoded Guess plus hint without logic
  guess.draw(0, %w[r r r r])
  guess.draw_hint(0, 1)
  guess.draw(1, %w[r r b b])
  guess.draw_hint(1, 2)
  guess.draw(2, %w[p g o y])
  guess.draw_hint(2, 1, 1)
  guess.draw(3, %w[p r o y])
  guess.draw_hint(3, 0, 2)
  guess.draw(3, %w[r g b o])
  guess.draw_hint(3, 4)
  guess.draw_board
end

def selection
  puts ''
  puts 'To Start'.bold.underline
  puts "Selection: Please select if you want to be the #{'CODEBREAKER'.red.bold} or #{'CODEMAKER'.green.bold}"
  print "  [ 1.#{'CODEBREAKER'.red.bold},  2.#{'CODEMAKER'.green.bold} ] : "
  input_detector(gets.chomp, [1, 2])
end

def input_detector(input, arr)
  until arr.to_s.include?(input)
    print 'Invalid input. Please try again: '
    input = gets.chomp
  end
  input
end

def codebreaker_msg
  system('clear')
  puts 'You chose codebreaker'
  puts 'Example guess: r r y b or red red yellow Blue'
end

def codemaker_msg
  system('clear')
  puts 'You chose codemaker. Please input four colors you want as the code'
  puts 'Example input: r r y b or red red yellow Blue'
end

def winner
  puts 'You win!'
end

def algo_winner
  puts 'I win!!!!!'
end

def loser
  puts 'You lose!'
end
