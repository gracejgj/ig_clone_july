class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @post = Post.new
    @posts = @user.posts

    @new_relationship = Relationship.new #when a form submit, it will send a request to relationship, create action
    @find_relationship = current_user.active_relationships.find_by(following_id: @user.id)
  end  #can be seen in form when inpect elements

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id]) #find user
    @user.update(user_params) #update user if validation pass

    if @user.save
      redirect_to user_path(@user), notice: 'Your profile was successfully updated.'
    else
      render :edit
    end
  end

  def followings
    @user = User.find(params[:id])
  end

  def followers
  end

  private
    def user_params
      params.require(:user).permit(:username, :birth_date, :avatar)
    end
end

#user setting page
#param:id is from localhost:3000/users/1/edit
