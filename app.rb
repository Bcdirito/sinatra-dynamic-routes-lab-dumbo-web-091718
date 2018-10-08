require_relative 'config/environment'
require 'pry'

class App < Sinatra::Base
  # Write your code here!

  get "/reversename/:name" do
    @reversed_name = params[:name].reverse
    "#{@reversed_name}"
  end

  get "/square/:number" do
    @number = params[:number].to_i
    "#{@number * @number}"
  end

  get "/say/:number/:phrase" do
    @number = params[:number].to_i
    @phrase = params[:phrase]
    return @phrase * @number
  end

  get "/say/:word1/:word2/:word3/:word4/:word5" do
    @sentence = params[:word1]
    @words = [params[:word2],params[:word3],
             params[:word4], params[:word5]]
    @words.each do |word|
      @sentence = @sentence + " " + word
    end
    "#{@sentence + "."}"
  end

  get "/:operation/:number1/:number2" do
    @operation = params[:operation]
    @number1 = params[:number1].to_i
    @number2 = params[:number2].to_i
    if @operation == "add"
      "#{@number1 + @number2}"
    elsif @operation == "subtract"
      "#{@number1 - @number2}"
    elsif @operation == "multiply"
      "#{@number1 * @number2}"
    else
      "#{@number1/@number2}"
    end
  end
end
