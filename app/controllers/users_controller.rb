class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]

  # 新規登録フォーム
  def new
    @user = User.new
  end

  # 新規登録処理
  def create
    @user = User.new(
      uid: params[:user][:uid],
      name: params[:user][:name],
      bio: params[:user][:bio],
      password: params[:user][:password],
      password_confirmation: params[:user][:password_confirmation]
    )

    if User.exists?(uid: @user.uid)
      @user.errors.add(:uid, "はすでに使用されています。")
      render :new
    elsif @user.save
      flash[:notice] = "ユーザー登録が完了しました。ログインしてください。"
      redirect_to top_login_form_path
    else
      render :new
    end
  end

  # プロフィール表示
  def show
    @tweets = Tweet.where(user_id: @user.id).order(created_at: :desc)
  end

  # プロフィール編集フォーム
  def edit
    redirect_to '/top/login_form' unless session[:login_uid] == @user.uid
  end

  # プロフィール更新処理
  def update
    if session[:login_uid] == @user.uid
      if @user.update(user_params)
        redirect_to user_path(@user), notice: 'プロフィールを更新しました'
      else
        render :edit
      end
    else
      redirect_to '/top/login_form'
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :bio)
  end
end
