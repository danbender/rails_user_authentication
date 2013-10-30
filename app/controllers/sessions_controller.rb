class SessionsController < ApplicationController

  def new
  end

  def create
    render_unauthorized and return unless params[:email]
    user = User.where(email: params[:email]).first
    if user and user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path
    else
      # invalid password
      render_unauthorized
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end

  private

    def render_unauthorized
      render status: 401, text: "401 Unauthorized"
    end

end
