module AliensOnEarth
  class Commander

    attr_reader :questions

    def initialize(title=nil)
      @questions = {}
      unless title.nil?
        puts "=============================="
        puts title
        puts "=============================="
      end
    end

    def prompt(key, question, value=nil)
      @questions[key] ||= {}
      print @questions.keys.length.to_s + ". " + question + ": "
      @questions[key][:question] = question
      @questions[key][:answer] = value.nil? ? gets.chomp! : value
    end

    def answer_for(question)
      @questions[:"#{question}"][:answer]
    end

  end
end
