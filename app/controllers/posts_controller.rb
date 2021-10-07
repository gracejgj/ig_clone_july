class PostsController <ApplicationController
  before_action :find_post, only: [:show, :edit, :update, :destroy]

  def create
    post = current_user.posts.create(post_params)

    if post.save
      redirect_to user_path(current_user), notice: 'Your post was successfully created.'
    else
      redirect_to user_path(current_user), alert: 'There was an error.'
    end
  end

  def show #need to find param id from routes
    @comment = Comment.new
    @comments = @post.comments
    @posts = Post.order(:comments).page(params[:page]).per(2)
  end

  def edit
  end

  def update
    @post.update(post_params)

    if @post.save
      redirect_to post_path(@post), notice: 'Post was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to user_path(current_user), notice: 'Post was successfully deleted.'
  end

  private
    def post_params
      params.require(:post).permit(:caption, :photo)
    end

    def find_post
      @post = Post.find(params[:id])
    end
end
