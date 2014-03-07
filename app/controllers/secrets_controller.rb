class SecretsController < ApplicationController
  def new
    @user = User.find(params[:user_id])
  end

  def create
    @user = User.find(params[:secret][:recipient_id])
    @secret = @user.received_secrets.new(secret_params)
    @secret.author_id = current_user.id

    if @secret.save
      redirect_to user_url(@user)
    else
      flash.now[:errors] = @secret.errors.full_messages
      render :new
    end
  end

  private
  def secret_params
    params.require(:secret).permit(:title)
  end
end
