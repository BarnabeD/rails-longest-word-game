class GamesController < ApplicationController

  @letters = []

  def new
    letter_array = ('A'..'Z').to_a
    selected_letters = []
    10.times do
      r_num = rand(0..25)
      selected_letters << letter_array[r_num]
    end
    @letters = (selected_letters)
  end

  def score
    word = params[:word].split('')
    if each_letter_in_array?(word, params[:word])
      @result = "Ok"
    else
      @result = "No"
    end
  end

  private

  def word_is_english
    #TODO : utilise l'API
    # def appel_api(attempt)
    #   api_url = "https://wagon-dictionary.herokuapp.com/#{attempt}" 
    #   serialized_answer = open(api_url).read 
    #   answer = JSON.parse(serialized_answer) 
    #   return answer 
    # end
  end

  def each_letter_in_array?(array, original)
    count = 0
    array.each do |l|
      if array.include?(l)
        count +=1
      else
        false
      end
    end
    return false if @letters != count
  end
end


