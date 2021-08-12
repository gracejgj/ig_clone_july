class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @post = Post.new
    @posts = @user.posts
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id]) #find user
    @user.update(user_params) #update user if validation pass

    if @user.save
      redirect_to user_path(@user), notice: 'Your profile was updated.'
    else
      render :edit
    end
  end

  private
    def user_params
      params.require(:user).permit(:username, :birth_date, :avatar)
    end
end

#user setting page
#param:id is from localhost:3000/users/1/edit
