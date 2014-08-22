class CommentsController < ApplicationController

  before_action :require_user

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(params.require(:comment).permit(:body))
    @comment.author = current_user

    if @comment.save
      flash[:notice] = "Comment successfully added."
      redirect_to post_path(@post)
    else
      render 'posts/show'
    end
  end

  def vote
    # it is necessary to make sure that each attribute that is passed into Vote.create()
    # is set. Otherwise you end up with blank fields in your database and are left
    # scratching your head as to why something isn't saving.
    comment = Comment.find(params[:id])
    @vote = Vote.create(voteable: comment, creator: current_user, vote: params[:vote])

    if @vote.valid?
      flash[:notice] = 'Your vote has been counted'
    else
      flash[:error] = 'Your vote has not been counted'
    end

    redirect_to :back
  end

end
