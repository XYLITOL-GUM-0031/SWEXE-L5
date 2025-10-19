class TweetsController < ApplicationController
  def create
    Tweet.create(message: params[:message], user_id: 1)
    redirect_to root_path
  end

  def like
    tweet = Tweet.find(params[:id])
    tweet.increment!(:likes)
    redirect_to root_path
  end

  def unlike
    tweet = Tweet.find(params[:id])
    tweet.decrement!(:likes) if tweet.likes > 0
    redirect_to root_path
  end
end
