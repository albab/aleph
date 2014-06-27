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
      symbolChance = 1 + rand(100)
      
      if (symbolChance < 40)
        symbol = "-"
        randomResult = (randomNumber1 * randomNumberMystery) - randomNumber2
      elsif (symbolChance > 40 && symbolChance < 80)
        symbol = "+"
        randomResult = (randomNumber1 * randomNumberMystery) + randomNumber2
      elsif (symbolChance > 80 && symbolChance < 90)
        symbol = "*"
        randomResult = (randomNumber1 * randomNumberMystery) * randomNumber2
      elsif (symbolChance > 90 && symbolChance < 100)
        symbol = "/"
        randomResult = (randomNumber1 * randomNumberMystery) / randomNumber2
      end
      
      @result = randomResult
      @missing = randomNumberMystery.to_s
      
      @expression = randomNumber1.to_s + randomLetter1 + " " + symbol + " " + randomNumber2.to_s + " " + "=" + " " + randomResult.to_s
    end
end
