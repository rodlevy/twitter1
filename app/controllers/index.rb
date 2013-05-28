get '/' do
end

get '/load_page/:username' do
  @user = TwitterUser.find_by_username(params[:username])
  @tweets = @user.fetch_tweets!
  @user.tweets << @tweets
  erb :user
end

get '/:username' do
  @user = TwitterUser.find_by_username(params[:username])
  if @user && !@user.tweets.empty? && !@user.stale?
    @tweets = @user.tweets.limit(10)
    erb :user
  else
    @user = TwitterUser.find_or_create_by_username(params[:username])
    erb :load_page
  end
end


