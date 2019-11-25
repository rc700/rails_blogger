# frozen_string_literal: true

class ArticlesController < ApplicationController
  layout 'application'
  include ArticlesHelper

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
    @comment = Comment.new
    @comment.article_id = @article.id
  end

  # Displays form for new article
  def new
    @article = Article.new
  end

  # Process data from form to create new article
  def create
    @article = Article.new(article_params)
    @article.save
    redirect_to(article_path(@article))
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to(articles_path)
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    @article.update(article_params)

    redirect_to(article_path(@article))
  end
end
