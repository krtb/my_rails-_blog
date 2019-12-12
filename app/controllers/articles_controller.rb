 class ArticlesController < ApplicationController
    # before actions work in order
    before_action :set_article, only: [:edit, :update, :show, :destroy]
    before_action :require_user, except: [:index, :show]
    before_action :require_same_user, only: [:edit, :update, :destroy]

    def index
        @articles = Article.paginate(:page => params[:page], :per_page => 2)
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
      @article = Article.new(article_params)
      # @article.user = User.first # ensure that Article has User, before implementing AUTH
      @article.user = current_user
      if @article.save
        flash[:success] = "Article was successfully created"
        redirect_to article_path(@article)
      else
        # :new also works, to route to neqw view
        render 'new'
      end
    end

    def update
      if @article.update(article_params)
        flash[:success] = "Article was successfully updated"
        redirect_to article_path(@article)
      else
        render 'edit'
      end
    end

    def show
    end

    def destroy
        # find article based on :id found in params hash 
        @article.destroy
        flash[:danger] = "Article was successfully deleted"
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

    def require_same_user
        if current_user != @article.user && !current_user.admin?
            flash[:danger] = "you can only edit or delte your own article "
            redirect_to root_path
        end
    end

 end