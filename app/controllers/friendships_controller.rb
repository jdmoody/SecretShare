class FriendshipsController < ApplicationController
  def create
    @out_friend_id = current_user.id
    @in_friend_id = params[:user_id]
    @friendship = Friendship.new(out_friend_id: @out_friend_id,
                                 in_friend_id: @in_friend_id)

    if @friendship.save
      redirect_to users_url
    else
      flash[:errors] = @friendship.errors.full_messages
      redirect_to users_url
    end

  end
end
