class SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user 
      if params[:session][:remember_me] == '1'
        remember(user)
      else
        forget(user)
      end
      redirect_to user
    else
      flash[:danger] = 'Invalid email/password combination'
      render 'new'
  end

  def destroy
  end

end
