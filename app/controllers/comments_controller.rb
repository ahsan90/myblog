class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    if @comment.save
      redirect_to @post
    else
      flash[:notice] = "Unable to post the comment"
      redirect_to @post
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to @comment.post
  end

  private
  def comment_params
    params.require(:comment).permit(:text)
  end
end
