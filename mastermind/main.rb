# frozen_string_literal: true

# Mastermind game
class Game
  def initialize
    # generate a 4-digit code with unique numbers between 1-6
    @solution = (1..6).to_a.shuffle.take(4)
    @total_guesses = 0

    explain_game
    puts "For testing - solution is #{@solution.join} \n\n"
    play
  end

  def explain_game
    puts '=== Mastermind ==='
    puts 'A code of 4 unique numbers from 1-6 has been generated (e.g. 6142)'
    puts 'and needs to be broken. You have 12 chances to break the code.'
    puts 'After each guess, you\'ll be provided with some feedback to assist'
    puts "in breaking the code.\n\n"
    puts "\'Completely correct\' means a number in your guess is correct and is in the correct position\n\n"
    puts "\'Partially correct\' means a number in your guess is correct but is in the WRONG position\n\n"
  end

  def play
    while @total_guesses < 12
      @total_guesses += 1

      guess = make_guess

      check_guess(guess)
    end
  end

  def make_guess
    loop do
      print "Guess ##{@total_guesses}: "
      guess = gets.to_i.digits.reverse

      return guess if valid_guess?(guess)

      puts 'Invalid guess. Try again.'
    end
  end

  def valid_guess?(guess)
    guess.all? { |i| i.instance_of?(Integer) && i >= 1 && i <= 6 } && guess.length == 4
  end

  def check_guess(guess)
    temp_solution = @solution[0..]
    complete = 0
    partial = 0

    guess.each_index do |i|
      if guess[i] == @solution[i]
        complete += 1
        temp_solution.delete(guess[i])
      end
    end

    guess.each do |n|
      partial += 1 if temp_solution.any?(n)
    end

    puts guess_results(complete, partial)
  end

  def guess_results(complete, partial)
    puts "Completely correct (number & position): #{complete}"
    puts "Partially correct (number only): #{partial}"
  end
end

Game.new
