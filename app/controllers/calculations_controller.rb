class CalculationsController < ApplicationController
    def create
      @sum = eval(params[:data])        
    end
  
    def index
      alphabet = ("a".."z").to_a
      randomLetter1 = alphabet.shuffle.sample
      
      randomNumber1 = 1 + rand(10)
      randomNumber2 = 1 + rand(10)     
      randomNumberMystery = 1 + rand(10)      
      symbolChance = 1 + rand(50)
      
      if (symbolChance < 50)
        symbol = "-"
        randomResult = (randomNumber1 * randomNumber2) - randomNumberMystery
      end
      else if (symbolChance > 50)
        symbol = "+"
        randomResult = (randomNumber1 * randomNumber2) + randomNumberMystery
      end
      
      @result = randomResult.to_s
      @expression = randomNumber1.to_s + randomLetter1 + " " + symbol + " " + randomNumber2.to_s + " " + "=" + " " + randomResult.to_s
    end
end
