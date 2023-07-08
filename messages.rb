# frozen_string_literal: true

require_relative 'board.rb'

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
  puts "The #{'CODEMAKER'.green.bold} #{'creates'.bold} a secret code by selecting a "\
    "sequence of colored circles."
  puts "The #{'CODEBREAKER\'s'.red.bold} objective is to #{'guess'.bold} the secret code"\
    " within 10 attempts."
  puts 'After each guess, the code maker provides feedback to the code breaker.'\
    ' The feedback consists of black and white pegs.'
  puts "  #{'Green'.green.bold} circle #{'●'.green} : Indicates the number of"\
    " pegs that are the #{'correct'.green.bold} color"\
    " and in the #{'correct'.green.bold} position."
  puts "  #{'Blue'.blue.bold}  circle #{'●'.blue} : Indicates the number of"\
    " pegs that are the #{'correct'.green.bold} color"\
    " but in the #{'wrong'.red.bold} position."
  puts "The code maker does not reveal which specific pegs in the guess"\
    " are correct; they only provide the total count of black and white pegs."
  puts "The code breaker uses the feedback to deduce the correct code."\
    " They can use logical reasoning and elimination "\
    "to narrow down the possibilities."
  puts "The game continues with the code breaker making"\
  " subsequent guesses and the code maker providing feedback until:"

  puts "  The code breaker correctly guesses the secret code, "\
    "in which case they #{'win'.green.bold} the game."
  puts"  The code breaker runs out of attempts without cracking"\
    " the code, resulting in a #{'lose'.red.bold}."
end

def sample_game
  puts ' '
  puts '  ┏━━━━━━━━━━━━━┳━━━━━━━━━┓'
  puts '1 ┃ ⬤  ⬤  ⬤  ⬤  ┃ ○ ○ ○ ○ ┃'
  puts '  ┣━━━━━━━━━━━━━╋━━━━━━━━━┫'
end