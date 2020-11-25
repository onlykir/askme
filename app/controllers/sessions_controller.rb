class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.authenticate(params[:email], params[:password])

    if user.present?
      log_in user
      redirect_to root_url, notice: 'Вы успешно залогинились!'
    else
      flash.now.alert = 'Неправильный mail или пароль!'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: 'Вы разлогинились! Приходите еще!'
  end
end
