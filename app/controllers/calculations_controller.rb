class CalculationsController < ApplicationController
    def create
      @sum = eval(params[:data])     
    end
  
    def index
      @correct = false
      alphabet = ("a".."z").to_a
      randomLetter1 = alphabet.shuffle.sample
      
      randomNumber1 = 1 + rand(10)
      randomNumber2 = 1 + rand(10)     
      randomNumberMystery = 1 + rand(10)      
      symbolChance = 1 + rand(100)
      
      if (symbolChance < 50)
        symbol = "-"
        randomResult = (randomNumber1 * randomNumberMystery) - randomNumber2
      end
      else if (symbolChance > 50)
        symbol = "+"
        randomResult = (randomNumber1 * randomNumberMystery) + randomNumber2
      end
      
      @result = randomResult
      @missing = randomNumberMystery.to_s
      
      @expression = randomNumber1.to_s + randomLetter1 + " " + symbol + " " + randomNumber2.to_s + " " + "=" + " " + randomResult.to_s
      
      if @sum == @missing
        @correct = true
      end
    end
end
