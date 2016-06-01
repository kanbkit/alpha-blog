class ArticlesController < ApplicationController
    
    before_action :set_article, only: [:show,:edit,:update,:destroy]
    
    
    def new
        @article =  Article.new
    end
    
    def create
        #debugger
        #render plain: params[:article].inspect
        @article = Article.new(article_params)
        @article.user = User.first
        if @article.save 
            flash[:success] = "Article was successfully create"
            redirect_to article_path(@article)
        else
            render 'new'
        end
    end
    
    def edit
       #@article = Article.find(params[:id])
       #if @article.nil?
        #    render 'edit'
       #else
        #    flash[:notice] = "Edit article"
        #    redirect_to article_path(@article)
       #end

    end
    
    def update
       #@article = Article.find(params[:id]) 
       if @article.update(article_params)
           flash[:success]="Article was updated"
           redirect_to article_path(@article)
       else
           render "edit"
       end
    end
    
    def index
        @articles = Article.all
    end
    
    def show
       #@article = Article.find(params[:id]) 
    end
    
    def destroy
        #@article = Article.find(params[:id])
        title = @article.title
        @article.destroy
        flash[:danger] = "The article \" #{title} \" was successfully deleted"
        redirect_to articles_path
    end
    
    
    #params   
    private
    def set_article
       @article = Article.find(params[:id]) 
    end

    def article_params
       params.require(:article).permit(:title,:description)
    end
end