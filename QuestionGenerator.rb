class QuestionGenerator
  def initialize(question_range)
    @first, @last = question_range
  end


  # return a string and a solution
  def gen_question
    num_one = rand(@first..@last)
    num_two = rand(@first..@last)

    {q:"#{num_one} plus #{num_two}", sol:num_one + num_two}
  end
end

# robot = QuestionGenerator.new([10, 20])
