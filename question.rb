# frozen_string_literal: true

class Question
  attr_accessor :question, :answer
  def initialize
    @num1 = nil
    @num2 = nil
    @question = nil
    @answer = nil
  end

  def generate_numbers(name)
    @num1 = rand(1..20)
    @num2 = rand(1..20)
    self.answer = @num1 + @num2
    self.question = "#{name}: What does #{@num1} plus #{@num2} equal?"
  end
end
