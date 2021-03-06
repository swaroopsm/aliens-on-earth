module AliensOnEarth

  # Class responsible for handling CLI
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

    # Prompt user for a question
    def prompt(key, question, value=nil)
      @questions[key] ||= {}
      print @questions.keys.length.to_s + ". " + question + ": " if value.nil?
      @questions[key][:question] = question
      @questions[key][:answer] = value.nil? ? gets.chomp! : value
    end

    # Returns answer for a particular question
    def answer_for(question)
      @questions[:"#{question}"][:answer]
    end

  end
end
