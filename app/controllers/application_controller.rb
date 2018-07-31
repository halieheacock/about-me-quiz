require './config/environment'
require './app/models/sample_model'

class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    return erb :index
  end
  
  post '/results' do
    
    # puts params
    
    points_array = params.values
    total = 0
    
    points_array.each do |point|
      total += point.to_i
    end
    
    # puts total
    
    result = calculator_results(total)
    
    if result == "We are tighter than a fat man in tights!"
      return erb :Besties
    elsif result == "Eh. We chill"
      return erb :Kindafriends
    else
      return erb :BoiBye
    end
    
end
