class SessionsController < ApplicationController
  #skip_before_filter :authorize
  #skip_authorization_check
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    ##binding.pry
    if user && user.authenticate(params[:session][:password])
      #binding.pry
      if user.activate
          #binding.pry
          log_in user
          current_user
          params[:session][:remember_me] == '1' ? remember(user) : forget(user)
          redirect_to user
          #binding.pry
      else
        #binding.pry
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

  def update
    id = params[:id].to_i
    session[:id] = User::ROLES.has_key?(id) ? id : 1
    flash[:success] = "Your new role #{User::ROLES[id]} was set!"
    redirect_to root_path
  end

  def destroy
    log_out if logged_in?
    ##binding.pry
    redirect_to root_url
  end

  private 

  def set_box
    case @box  
      when @box != nil
        Box.find(session[:box_id])
      when @box == nil 
        @box = Box.create 
        session[:box_id] = @box.id 
    end 
  end 

  def set_order
    case @order  
      when @order != nil
        Order.find(session[:order_id])
      when @order == nil 
        @order = Order.create 
        session[:order_id] = @box.id 
    end 
  end

  protected 
    def authorize
        unless User.find_by_id(session[:user_id]) 
            redirect_to login_url, :notice => "Please log in"
        end 
    end 
end
