class SessionsController < ApplicationController
  skip_before_filter :authorize
  def create
    @user = User.find_by(email: params[:session][:email].downcase)
    # @user = User.find_by(email: params[:session][:email].downcase)
    # if @user && @user.authenticate(params[:session][:password])
    #  log_in @user
    #   redirect_to root_url
    # else
    #   flash.now.alert = "Email or password is invalid"
    #   render "new"
    # end
    if @user && @user.authenticate(params[:session][:password])
      if @user.activated?
          log_in @user 
          params[:session][:remember_me] == '1' ? remember(user) : forget(user)
          redirect_to @user
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

  private 

  def set_box
    case @box  
    when @box != nil
       = Box.find(session[:box_id])
    when @box == nil 
    @box = Box.create 
    session[:box_id] = @box.id 
    end 
  end 

  protected 
    def authorize
        unless User.find_by_id(session[:user_id]) 
            redirect_to login_url, :notice => "Please log in"
        end 
    end 
end
