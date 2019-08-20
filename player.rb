# frozen_string_literal: true

class Player
  attr_accessor :name, :lives, :short_name
  MAX_LIVES = 3

  def initialize(name, short_name)
    @lives = MAX_LIVES
    @name = name
    @short_name = short_name
  end

  def dead?
    lives === 0
  end

  def incorrect_answer
    self.lives -= 1
  end
end
