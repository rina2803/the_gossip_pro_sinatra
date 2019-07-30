
require 'gossip'
class ApplicationController < Sinatra::Base
  
get '/' do
  erb :index, locals: {gossips: Gossip.all}
end


get '/gossips/new/' do
  erb :new_gossip
end
post '/gossips/new/' do
  Gossip.new(params["gossip_author"], params["gossip_content"]).save
   redirect '/'
end

 get '/gossips/:id' do
    page = params[:id].to_i 
    erb :show, locals: {gossips: Gossip.find(page), page: page + 1 }
  end


 get '/gossips/id/edit/' do
    page = params[:id].to_i 
    erb :edit, locals: {gossips: Gossip.find(page), page: page + 1 }
      Gossip.update(params["gossip_author"], params["gossip_content"]).save
  end

end
