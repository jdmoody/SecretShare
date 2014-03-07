class FriendshipsController < ApplicationController
  def create
    sleep(2)
    @out_friend_id = current_user.id
    @in_friend_id = params[:user_id]
    @friendship = Friendship.new(out_friend_id: @out_friend_id,
                                 in_friend_id: @in_friend_id)

    if @friendship.save
      render :json => @friendship
      # head :ok?????
    else
      flash[:errors] = @friendship.errors.full_messages
      redirect_to users_url
    end

  end
end
