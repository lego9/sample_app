class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      # Осуществить вход пользователя запоминание и перенаправление на страницу профиля.
      log_in user
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      redirect_to user
    else
      # Выдать сообщение об ошибке.
      flash.now[:danger] = 'Invalid email/password combination' # Не совсем верно!
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end