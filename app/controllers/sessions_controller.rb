class SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      if user.activated?
          log_in user 
          params[:session][:remember_me] == '1' ? remember(user) : forget(user)
          redirect_to user
      else
          message = "account is not activated"
          message += "check your email for the activation link"
          flash[:danger] = message
          redirect_to root_url
      end
    else 
      flash.now[:danger] = 'invalid email/password combination'
      render 'new'
    end     
  end

  def destroy
    log_out if logged_in?
    binding.pry
    redirect_to root_url
  end
end
