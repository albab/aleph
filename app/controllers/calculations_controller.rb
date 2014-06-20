class CalculationsController < ApplicationController
  def create
      @sum = eval(params[:data])        
  end
end
