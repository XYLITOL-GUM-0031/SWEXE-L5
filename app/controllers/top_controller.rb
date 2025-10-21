class TopController < ApplicationController
  def main
    @tweets = Tweet.all.order(created_at: :desc)
  end

  def login_form
  end

  def login
    user = User.find_by(uid: params[:uid])

    if user && user.authenticate(params[:pass])
      session[:login_uid] = user.uid
      redirect_to root_path, notice: "ログインしました！"
    else
      flash[:alert] = "ユーザーIDまたはパスワードが違います。"
      render :login_form
    end
  end

  def logout
    session.delete(:login_uid)
    redirect_to root_path, notice: "ログアウトしました。"
  end
end
