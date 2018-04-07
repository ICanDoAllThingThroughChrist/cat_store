module SessionsHelper
    # Filter method to enforce a login requirement
    # Apply as a before_action on any controller you want to protect
    # helper_method :current_user
    def admin
        user_id = session[:user_id]
        @current_user ||= User.find_by(id: user_id)
        @current_user.role_id= 9 
        admin= @current_user.role_id= 9
        admin
    end 
    
    def subscriber 
        binding.pry
        user_id = session[:user_id]
        @current_user ||= User.find_by(id: user_id)
        subscriber= @curren_user.role_id= 8
        subscriber
    end 
    def authenticate
    logged_in? || access_denied
    end

    def log_in(user)
        session[:user_id] = user.id
    end

    def forget(user)
        user.forget 
        cookies.delete(:user_id)
        cookies.delete(:remember_token)
    end

    def remember(user)
        user.remember 
        cookies.permanent.signed[:user_id] = user.id 
        cookies.permanent[:remember_token] = user.remember_token
    end

    def current_user?(user)
        user == current_user 
    end
    
    def current_user 
        if (user_id = session[:user_id])
            @current_user ||= User.find_by(id: user_id)
        elsif (user_id = cookies.signed[:user_id]) 
            user = User.find_by(id: user_id)
            if user && user.authenticated?(:remember, cookies[:remember_token])
                log_in user 
                @current_user = user 
            end 
        end 
    end

    def logged_in?
        !current_user.nil? #current_user is not nil(aka not empty)
    end

    def log_out 
        forget(current_user)
        session.delete(:user_id)
        @current_user = nil 
    end

    def destroy 
        log_out if logged_in? 
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
        session[:order_id] = @order.id 
    end 
  end
end
