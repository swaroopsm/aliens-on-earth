module AliensOnEarth
  class Commander

    attr_reader :questions

    def initialize(title)
      puts "=============================="
      puts title
      puts "=============================="
      @questions = {}
    end

    def prompt(key, question)
      @questions[key] ||= {}
      print @questions.keys.length.to_s + ". " + question + ": "
      @questions[key][:question] = question
      @questions[key][:answer] = gets.chomp!
    end

    def answer_for(question)
      @questions[:"#{question}"][:answer]
    end

  end
end
