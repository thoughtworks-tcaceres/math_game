# frozen_string_literal: true

# require './player.rb'
# require './question.rb'

class Game
  attr_accessor :players, :round, :player_turn
  def initialize
    @players = [Player.new('Player 1', 'P1'), Player.new('Player 2', 'P2')]
    @round = 0
    @player_turn = 0
  end

  def header(word)
    puts '======='
    puts word
    puts '======='
  end

  def next_round
    self.round += 1
    @player_turn = round % players.length
  end

  def game_over?
    players.find(&:dead?)
  end

  def correct_answer
    puts 'YES! You are correct.'
  end

  def incorrect_answer
    puts 'Seriously? No!'
    players[player_turn].incorrect_answer
  end

  def player_summary
    @players.each.with_index do |player, index|
      print 'vs ' if index != 0
      print "#{player.short_name}: #{player.lives}/#{Player::MAX_LIVES} "
    end
    puts ''
  end

  def player_wins
    puts "#{@players[player_turn].name} wins with a score of #{@players[player_turn].lives}/#{Player::MAX_LIVES}"
  end

  def play
    until game_over?
      header('NEW TURN')
      question = Question.new
      question.generate_numbers(players[player_turn].name)
      puts question.question
      print '>'
      answer = gets.chomp.to_i
      answer == question.answer ? correct_answer : incorrect_answer

      player_summary
      next_round

      next unless game_over?

      player_wins
      header('GAME OVER')
      puts 'GOODBYE!'

    end
  end
end
