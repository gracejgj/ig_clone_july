class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])  #we need to know the post id        #send a request to this part use .new (from show.html.erb) and run the code inside
    @comment = @post.comments.create(comment_params.merge(user_id: current_user.id)) #use merge 1. to know which user is commenting 2. by getting the current user

    if @comment.save
      redirect_to post_path(@post), notice: 'Comment was succesfully created'
    else
      redirect_to post_path(@post), notice: 'There was an error.'
  end
end

  private
  def comment_params
    params.require(:comment).permit(:content)
  end
end
