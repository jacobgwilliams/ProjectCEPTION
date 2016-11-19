class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by(email: params[:session][:email])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      flash[:notice] = "Welcome, #{current_user.name}!"
      redirect_to '/'
    else
      @error="Incorrect email/password combination."
      render 'new'
    end
  end

  def destroy
    require_login
    session.destroy
    flash[:notice] = "BYE FELISHA"
    redirect_to '/sessions/new'
  end

end
