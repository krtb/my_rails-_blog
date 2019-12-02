 class ArticlesController < ApplicationController
    before_action :set_article, only: [:edit, :update, :show, :destroy]

    def index
        @articles = Article.all
    end

    def new
        @article = Article.new
    end

    def edit
        
    end

    def create
        # debugger 
        # can view article params in console with article_params below, typing (n) moves you console to next line
        # @article.user.username to get properties from params object hash


        # render plain: params[:article].inspect # <ActionController::Parameters {"title"=>"hello", "description"=>"there!\r\n"} permitted: false>
        @article = Article.new(article_params) #need to white list values of Article, with what's beeing passed in from params  hash
        
        @article.user = User.first # ensure that Article has User, before implementing AUTH
        
        if @article.save
            flash[:success] = "Article was successfully created" #show message to user
            redirect_to article_path(@article) # article GET /articles/:id article#show
        else
            render :new #render new view, to give user change to try again
        end
    end

    def update
        @article = Article.new(article_params)
        if @article.save
            flash[:success] = "Article was successfully updated"
            redirect_to article_path(@article) # redirect to Article show page, article GET /articles/:id article#show
        else # if did not pass validations
            render 'edit' #render EDIT template again, 2nd way to do this is with ('') instead of (:)
        end
    end

    def show
        
    end

    def destroy
        # find article based on :id found in params hash 
        
        flash[:danger] = "Article was successfully deleted"
        @article.destroy
        redirect_to articles_path
    end

    private

    # runs at start, only inside of methods = :edit, :update, :show, :destroy
    def set_article
        # first find Article to edit, with :id
        @article = Article.find(params[:id])
    end

    def article_params
        params.require(:article).permit(:title, :description)
    end


 end