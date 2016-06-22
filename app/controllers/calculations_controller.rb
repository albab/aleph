class CalculationsController < ApplicationController
    include ExpressionHelper
    def create
      @sum = calculation_params
      if @sum[:answer] == session[:missing]
        @correct = true
        response = ExpressionHelper.random_exp
        if response.include? nil
          response = ExpressionHelper.random_exp
        end
        @result = response[0]
        @missing = response[1]
        @expression = response[2]
        session[:missing] = @missing
      else
        @correct = false
        @result = session[:result]
        @missing = session[:missing]
        @expression = session[:expression]
      end
    end
    def index
      response = ExpressionHelper.random_exp
      if response.include? nil
        response = ExpressionHelper.random_exp
      end
      @result = response[0]
      @missing = response[1]
      @expression = response[2]
      session[:ugh] = response
      session[:missing] = @missing
      session[:expression] = @expression
      session[:result] = @result
    end
    private
      def calculation_params
        params.require(:calculation).permit(:answer)
      end
end
