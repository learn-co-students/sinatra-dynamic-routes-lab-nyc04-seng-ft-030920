require_relative 'config/environment'

class App < Sinatra::Base

  get '/reversename/:name' do
    @name = params[:name]
    name_array = @name.split("")
    "#{name_array.reverse.join}"
  end

  get '/square/:number' do
    @number = params[:number].to_i
    "#{@number ** 2}"
  end

  get '/say/:number/:phrase' do
    @number = params[:number].to_i
    @phrase = params[:phrase].split("%20")
     "#{@phrase.join} "* @number
  end

  get '/say/:word1/:word2/:word3/:word4/:word5' do
    phrase_array = [
      params[:word1],
      params[:word2],
      params[:word3],
      params[:word4],
      params[:word5]]
    phrase_parsed = phrase_array.map {|word| " #{word}"}
    phrase_parsed << "."
    phrase_parsed
  end

  get '/:operation/:number1/:number2' do
    ops = {
      "add"=> :+,
      "subtract" => :-,
      "multiply" => :*,
      "divide" => :/
    }
    @oper = params[:operation]
    @number1 = params[:number1].to_i
    @number2 = params[:number2].to_i
    "#{@number1.send(ops[@oper], @number2)}"
  end
end