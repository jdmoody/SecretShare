class SecretsController < ApplicationController
  def new
    @user = User.find(params[:user_id])
  end

  def create
    @user = User.find(params[:secret][:recipient_id])
    @secret = Secret.new(secret_params)
    @secret.author_id = current_user.id
    # @secret.tag_ids

    if @secret.save
      render :json => @secret
    else
      flash.now[:errors] = @secret.errors.full_messages
      render :new
    end
  end

  private
  def secret_params
    params.require(:secret).permit(:title, :recipient_id, tag_ids: [])
  end

  def tag_params
    # params.permit(tags:
  end
end