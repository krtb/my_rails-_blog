class SessionsController < ApplicationController

    def new
    
    end

    def create
    # debugger, to view param
     user = User.find_by(email: params[:session][:email].downcase)

     if user && user.authenticate(params[:session][:password])
        # use to simulate a login, store in browser cookies 
        # saving in browsers session hash 
        session[:user_id] = user.id 

        flash[:success] = "You have successfully logged in"

        redirect_to user_path(user)
     else
        # flash.now = because not considered new http req, would flash 2 times. This way only once. 
        flash.now[:danger] = "There was something wrong with your information"
        render 'new'
     end
    end

    def destroy
      session[:user_id] = nil
      flash[:success] = "You have logged out."
      redirect_to root_path
    end

end