class CommentsController < ApplicationController

  before_action :require_user

  def create
    @post = Post.find_by(slug: params[:post_id])
    @comment = @post.comments.build(params.require(:comment).permit(:body))
    @comment.author = current_user

    if @comment.valid?
      @comment.save
      flash[:notice] = "Comment successfully added."
      redirect_to post_path(@post)
    else
      flash[:error] = 'Please submit a comment with text in it.'
      redirect_to post_path(@post)
    end
  end

  def vote
    # it is necessary to make sure that each attribute that is passed into Vote.create()
    # is set. Otherwise you end up with blank fields in your database and are left
    # scratching your head as to why something isn't saving.
    @comment = Comment.find(params[:id])
    @vote = Vote.create(voteable: @comment, creator: current_user, vote: params[:vote])

    respond_to do |format|
      format.html { redirect_to :back, notice: 'Your comment has been created' }
      format.js
    end

  end

end
