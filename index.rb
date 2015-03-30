require "sinatra"
set :bind, '0.0.0.0'

def get_mood(mood)
    mood = mood.downcase
    return mood
end

def get_message(mood)
    case mood
    when "angry"
        message = "Your mood is #{mood}.  Suggestions to say include: How's your pet doing, if you have one?  Do you have a kitty? (People always become 
happy when you talk about kitties)."
    when "afraid"
message = "Your mood is #{mood}.  Suggestions to say include: Where do you live?  Are you doing anything nice this weekend?  (Become less afraid 
of people when you know they are far away from you)."
    when "awkward"
message = "Your mood is #{mood}.  Suggestions to say include: What's your favorite color?  Are you ready for spring (or whatever 
season it is)?  (Lighten the mood up by talking about glorious pastels)."
    when "frustrated"
    message = "Your mood is #{mood}.  Suggestions to say include: Are you hungry or thirsty?  Want me to get you anything? (Buy some time 
        by running to the buffet or bar)."
    when "happy"
message = "Your mood is #{mood}.  Suggestions to say include: Do you play a sport?  Tell me about your team. (Hopefully, they are an 
    equestrian and will start talking about horses for hours, in which case you can actually participate in the conversation)."
    when "okay"
message = "Your mood is #{mood}.  Suggestions to say include: Wow, it's really hot/cold/windy/rainy out. (They will follow your lead and 
        make traditional small talk about the weather, during which you can have a very light and casual conversation about nothing terribly 
        important)."
    else 
        message = "Can you think of anything to say by yourself?  I feel your pain."
    end
end

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
