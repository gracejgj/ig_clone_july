class RelationshipsController < ApplicationController
  def create
    @user = User.find(params[:following_id])                        #find user id that you want to follow and to get the param
    current_user.active_relationships.create(following_id: @user.id)
    redirect_to user_path(@user) #back to user page
  end

  def destroy
    relationship = Relationship.find(params[:id])
    user = relationship.following #get the relationship. get the current user
    #after destroy
    relationship.destroy
    redirect_to user_path(user)
  end

end

#active_relationships is inside the user models
