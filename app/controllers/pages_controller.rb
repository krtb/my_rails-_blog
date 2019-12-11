#written in camel case
class PagesController < ApplicationController # inherits/subclasses from ApplicationController

    #actions ARE methods
    def home
        redirect_to articles_path if logged_in?
    end

    def about
    end

end