class FriendshipsController < ApplicationController
  def create
    @out_friend_id = current_user.id
    @in_friend_id = params[:user_id]
    @friendship = Friendship.new(out_friend_id: @out_friend_id,
                                 in_friend_id: @in_friend_id)

    if @friendship.save
      render :json => @friendship
    else
      flash[:errors] = @friendship.errors.full_messages
      redirect_to users_url
    end

  end

  def destroy
    @user = Friendship.find(params[:user_id])
    @friendship = Friendship.find_by(out_friend_id: current_user,
                                     in_friend_id: @user)
    @friendship.destroy
    head :ok
  end
end
