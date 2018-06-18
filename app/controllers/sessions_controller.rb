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
  def facebook
    if @user = User.where(uid: auth['uid']).first_or_create do |u|
          u.name = auth['info']['name']
          u.email = auth['info']['email']
          binding.pry
          u.password_digest = auth['info']['password']
          u.id = auth['uid']
        end
        binding.pry
        @user.save
        session[:user_id]= @user.id
        session[:email]= @user.email
        session[:name]= @user.name
        session[:uid]= @user.uid
        current_user= @user 
        log_in @user
        @user.activate
        render 'welcome/home'
      binding.pry
      #   # Load the cart from the session, or create a new empty cart.
      #   cart = session[:cart] || []
      #   cart << @item.id
 
      # # Save the cart in the session.
      # session[:cart] = cart
    else 
        redirect_to root_url
        binding.pry
    end
  end

  def update
    id = params[:id].to_i
    session[:id] = User::ROLES.has_key?(id) ? id : 1
    flash[:success] = "Your new role #{User::ROLES[id]} was set!"
    redirect_to root_path
  end

  def destroy
    session[:user_id]= nil
    binding.pry
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
 
  def auth
    request.env['omniauth.auth']
  end

  protected 
    def authorize
        unless User.find_by_id(session[:user_id]) 
            redirect_to login_url, :notice => "Please log in"
        end 
    end 
end
