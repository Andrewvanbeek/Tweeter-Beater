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
    tweet_beater_subject = params[:game][:tweet_subject]
    tweets = $twitter.search("#{tweet_beater_subject} -rt").take(10)
    game_tweets = []
      tweets = tweets.take(10)
      tweets.each do |tweet|
        if tweet.user
          game_tweets << Tweet.create(tweet_text: tweet.text, real_name: tweet.user.name, user_name: tweet.user.screen_name)
        else
          game_tweets << Tweet.create(tweet_text: tweet.text)
        end
      end
    @user = User.find(session[:user_id])
    @game = Game.create(player_id: @user.id)
    game_tweets.each do |tweet|
      @game.tweets << tweet
    end
    @game.save
    puts @game
    redirect_to games_path
  end

  def index
    @game = Game.last
    @tweets = @game.tweets.map {|tweet| "#{tweet.tweet_text}, as said by: @#{tweet.user_name}"}
  end

  private

  def game_params
    params.require(:game).permit(:tweet_subject)
  end

end


