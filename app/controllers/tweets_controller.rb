class TweetsController < ApplicationController
  def create
    Tweet.create(message: params[:message], user_id: current_user.id)
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

  # 👇 これを追加
  def destroy
    tweet = Tweet.find(params[:id])
    tweet.destroy
    redirect_to root_path, notice: "ツイートを削除しました。"
  end
end
