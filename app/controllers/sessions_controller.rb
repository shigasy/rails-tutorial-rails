class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      # ユーザーログイン後にユーザー情報のページにリダイレクトする
      log_in user
      puts user
      redirect_to user
    else
      # エラーメッセージを作成する
      flash.now[:danger] = 'Invalid email/password combination' # 本当は正しくない

      render 'new'
      # redirect_to '/login' # renderだと再レンダリングしてもリクエストとは見なされない
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
