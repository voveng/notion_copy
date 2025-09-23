class SessionsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :new, :create ]
  def new
    
  end

  def create
    if user = User.authenticate_by(email: params[:email], password: params[:password])
      ap user
      login(user)
      redirect_to root_path
    else
      flash.now[:error] = "Invalid email or password"
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    logout
    redirect_to login_path
  end
end
