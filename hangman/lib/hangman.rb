# frozen_string_literal: true

require 'msgpack'

# Hangman wrapper
class Hangman
  def initialize
    puts 'Welcome to Hangman'

    Game.new unless load_game?
  end

  private

  def load_game?
    loop do
      print 'Load a saved game? (y/N): '
      response = gets.chomp.downcase

      if response == 'y'
        if File.exist?('save.txt')
          data = MessagePack.unpack(File.read('save.txt'))
          Game.new(data[0], data[1], data[2])
          return true
        else
          print 'Could not find a saved game. Starting a new game.'
          return false
        end
      elsif ['', 'n'].include?(response)
        return false
      end

      puts 'Invalid response.'
    end
  end
end

# Game class
class Game
  def initialize(word = select_word, cryptogram = Array.new(word.length, '_'), guesses_left = 6)
    @word = word
    @cryptogram = cryptogram
    @guesses_left = guesses_left

    puts "\nYou may type \'save\' at any time to save your game."
    play_round
  end

  private

  def play_round
    until @guesses_left.zero?
      puts '', cryptogram
      puts "You have #{@guesses_left} guess(es) left."
      response = make_guess
      break if save_game?(response)

      @guesses_left -= 1 unless correct?(response)
      break if word_completed?
      break if game_over?
    end
  end

  def save_game?(response)
    return false unless response == 'SAVE'

    file = File.open('save.txt', 'w')
    file.print([@word, @cryptogram, @guesses_left].to_msgpack)
    puts 'Game saved!'
    true
  end

  def cryptogram
    @cryptogram.join(' ')
  end

  def select_word
    words = File.read('wordlist.txt').split("\n").select do |word|
      word.length >= 5 && word.length <= 12
    end

    words.sample.upcase
  end

  def valid_guess?(guess)
    guess == 'SAVE' || (guess.length == 1 && guess.ord.between?(65, 90))
  end

  def make_guess
    loop do
      print 'Guess a letter: '
      guess = gets.chomp.upcase

      return guess if valid_guess?(guess)

      puts 'Invalid guess. Try again.'
    end
  end

  def correct?(guess)
    return false unless @word.include?(guess)

    update_cryptogram(guess)
  end

  def update_cryptogram(guess)
    @word.chars.each_index do |i|
      @cryptogram[i] = guess if @word[i] == guess
    end
  end

  def word_completed?
    return false unless @word.chars == @cryptogram

    puts "You win! The word is #{@word}."
    true
  end

  def game_over?
    return false unless @guesses_left.zero?

    puts "You lose - no more guesses. The word was #{@word}."
    true
  end
end

Hangman.new
