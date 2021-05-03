
get '/' do
    @finstagram_posts = FinstagramPost.order(created_at: :desc) 
    erb(:index)
end

get '/signup' do
    @user = User.new
    erb(:signup)
end

post '/signup' do
    email      = params[:email].strip
    avatar_url = params[:avatar_url].strip
    username   = params[:username].strip
    password   = params[:password]


    @user = User.new({ email: email, avatar_url: avatar_url, username: username, password: password })
    
    if @user.save
       "User #{username} s aved!"

    else
        erb(:signup)
    end

  end

