require "sinatra"
set :bind, '0.0.0.0'

get '/:mood' do 
    setup_index_view
end

get '/message/:mood' do
    mood = params[:mood]
    @message = get_message(mood)
    erb :index
end

get '/' do 
    erb :form
end

post '/' do
    mood = params[:mood]
    if valid_mood(mood)
        mood = get_mood(mood)
        redirect "/message/#{mood}"
    else
        @error = "Sorry!  You must enter a mood from the choices given!"
        erb :form
    end
end

def setup_index_view
    mood = params[:mood]
    mood = get_mood(mood)
    @message = get_message(mood)
    erb :index
end

def valid_mood(input)
    if input == "angry"
        true
        elsif input == "afraid"
        true
        elsif input == "awkward"
        true 
        elsif input == "frustrated"
        true 
        elsif input == "happy"
        true
        elsif input == "okay"
        true
    else 
        false
    end
end
