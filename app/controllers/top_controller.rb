class TopController < ApplicationController
  def main
    @tweets = Tweet.all.order(created_at: :desc)
  end

  def login_form
  end

  def login
    user = User.find_by(uid: params[:uid])
    if user && user.authenticate(params[:pass])
      session[:user_id] = user.id
      redirect_to root_path, notice: "ログイン成功しました！"
    else
      redirect_to '/top/login_form', alert: "ユーザーIDまたはパスワードが違います。"
    end
  end

  def logout
    session.delete(:user_id)
    redirect_to root_path, notice: "ログアウトしました。"
  end
end

