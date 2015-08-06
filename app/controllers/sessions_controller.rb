class SessionsController < ApplicationController
  skip_before_filter :require_login, except: [:destroy]

  def new
    @user = User.new
  end

  def create
    if @user = login(params[:email], params[:password], params[:remember_me])
      redirect_back_or_to @user
    else
      flash.now[:alert] = "Login failed"
      render 'new'
    end
  end

  def destroy
    logout
    redirect_to root_url
  end
end
