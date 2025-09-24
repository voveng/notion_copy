class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[new create]
  layout 'sessions'
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      login(@user)
      redirect_to root_path
    else
      flash.now[:error] = "#{@user.errors.full_messages.to_sentence}"
      render :new, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
