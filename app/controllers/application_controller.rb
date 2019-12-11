class ApplicationController < ActionController::Base
    # these methods available to all controllers, but not to views by default

    helper_method :current_user, :logged_in?

    def current_user
        # return user, if user id from session stored in browser session hash
        # add minimalization
        @current_user ||=  User.find(session[:user_id]) if session[:user_id]
    end

    def logged_in?
        # return true if current user, return false if not 
        !!current_user 
    end

    def require_user

        if !logged_in?
            flash[:danger] = "You must be logged in to perform that action"
            redirect_to root_path
        end
    end
end
