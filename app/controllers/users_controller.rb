class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        # need to write user.save to save to database
        if @user.save
            # if user saves, want to display a message
            flash[:success] = "Welcome to Kurt's rails blog, #{@user.username}"
            # once saved, display list of articles that belong to that user
            redirect_to articles_path
        else
            # if wrong info, return to new view template page to re-enter info
            # will display error messages from errors partial
            return 'new'
        end
    end

    private

    def user_params
        params.require(:user).permit(:username, :email, :password)
    end
end