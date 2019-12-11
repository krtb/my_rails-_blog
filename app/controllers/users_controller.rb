class UsersController < ApplicationController
    before_action :set_user, only: [:edit, :update, :show ]
    before_action :require_same_user, only: [:edit, :update ]

    def index
        # display a list of all users, use paginate 
        @users = User.paginate(:page => params[:page], :per_page => 2)
    end

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

    def edit
    end

    def update

        if @user.update(user_params)
            flash[:success] = "Your account was updated succesfully."
            redirect_to articles_path
        else
            return 'edit'
        end 
    end

    def show
        # create an instance var of all users articles with pagination
        @user_articles = @user.articles.paginate(:page => params[:page], :per_page => 2)
    end

    private
    def set_user
        @user = User.find(params[:id])
    end

    def user_params
        params.require(:user).permit(:username, :email, :password)
    end

    def require_same_user
        if  current_user !=  @user
            flash[:danger] = "You can only edit your own account"
            redirect_to root_path
        end
    end

end