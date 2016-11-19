class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by(email: params[:session][:email])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      if is_admin?
        flash[:notice] = "Welcome, admin #{current_user.name}!"
        redirect_to "/users/#{@user.id}"
      else
        flash[:notice] = "Welcome, student #{current_user.name}!"
        redirect_to '/'
      end
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
