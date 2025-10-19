class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(uid: params[:user][:uid], age: params[:user][:age])
    @user.set_password(params[:user][:pass])

    if @user.save
      redirect_to '/top/login_form', notice: 'ユーザー登録が完了しました！'
    else
      render :new, status: :unprocessable_entity
    end
  end
end
