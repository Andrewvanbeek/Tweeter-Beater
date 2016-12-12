class GamesController < ApplicationController
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  def show
    @game = Game.find(params[:id])
  end

  def new
    @game = Game.new
  end

  def create
    @user = User.find(session[:user_id])
    @game = Game.create(player_id: @user.id, tweet_subject: game_params["tweet_subject"])
    redirect_to games_path
  end

  def index
    @game = Game.last
    p @game.tweet_subject
    @tweets = $twitter.search("#{@game.tweet_subject} -rt")
    @tweets = @tweets.take(20)
    @tweets = @tweets.map {|tweet| Tweet.create(tweet_text: tweet.text, real_name: tweet.user.name, user_name: tweet.user.screen_name)}
    @tweets = @tweets.map {|tweet| "#{tweet.user_name}: #{tweet.tweet_text}" }
    @tweets = [ @tweets.sample ]
  end

  private

  def game_params
    params.require(:game).permit(:tweet_subject)
  end

end


