get '/' do
end

get '/:username' do

  @user = TwitterUser.find_by_username(params[:username])
  if @user && !@user.tweets.empty? && !@user.stale?
    @tweets = @user.tweets.limit(10)
  else
    @new_user = TwitterUser.create(:username => params[:username])
    @tweets = @new_user.fetch_tweets!
    @new_user.tweets << @tweets 
  end
  erb :user
end
