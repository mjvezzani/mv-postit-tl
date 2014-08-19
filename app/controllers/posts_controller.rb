class PostsController < ApplicationController

  before_action :set_post, only: [:show, :edit, :update, :vote]
  before_action :require_user, except: [:index, :show]
  before_action :editable?, only: [:edit]

  def index
    @posts = Post.order(created_at: :desc)
  end

  def show
    @comment = Comment.new
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.author = current_user
    if @post.save
      flash[:notice] = "You have successfully created a post."
      redirect_to posts_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      flash[:notice] = "You have successfully updated your post."
      redirect_to posts_path
    else
      render :edit
    end
  end

  def vote
    @vote = Vote.create(voteable: @post, creator: current_user, vote: params[:vote])

    if @vote.valid?
      flash[:notice] = "Your vote has been counted"
    else
      flash[:error] = "Your vote has not been counted"
    end

    redirect_to :back
  end

  private

  def post_params
    params.require(:post).permit(:title, :description, :url, :user_id)
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def editable?
    if !(session[:user_id] == @post.author.id)
      flash[:error] = 'You are not authorized to edit that article'
      redirect_to root_path
    end
  end
end