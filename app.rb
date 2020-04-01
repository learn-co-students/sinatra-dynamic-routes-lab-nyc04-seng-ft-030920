require_relative 'config/environment'

class App < Sinatra::Base
  
  
  get '/reversename/:name' do 
    @backwards = params[:name]
    "#{@backwards.reverse}"
  end 

  get '/square/:number' do 
    @square = (params[:number].to_i) * (params[:number].to_i)
    @square.to_s
  end 

  get '/say/:number/:phrase' do 
    @n = params[:number].to_i
    @torepeat = params[:phrase]

    "#{@torepeat * @n}"
  end 

  get '/say/:word1/:word2/:word3/:word4/:word5' do
    @sentence = params[:word1] + " " + params[:word2] + " " + params[:word3] + " " + params[:word4] + " " + params[:word5]
    "#{@sentence}."
  end 

  get '/:operation/:number1/:number2' do 
      @does = params[:operation]
      @num1 = params[:number1].to_i
      @num2 = params[:number2].to_i
      if @does == "add"
        "#{@num1 + @num2}"
      elsif @does == "subtract"
        "#{@num1 - @num2}"
      elsif @does == "multiply"
        "#{@num1 * @num2}"
      elsif @does == "divide"
        "#{@num1 / @num2}"
      else
        "Input not valid!"
      end 

  end 

end