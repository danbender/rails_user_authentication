class UsersController < ApplicationController

  def new
  end

  def show
    @logged_in_user = User.find(session[:user_id])
  end

  def create
    @user = User.new params[:user]
    if @user.save
      session[:user_id] = @user.id
    else
      render status: 401, text: '401 and I hate your face' and return
    end
    redirect_to @user
  end


end