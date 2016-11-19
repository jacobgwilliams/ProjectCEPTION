class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save && key_validation
      redirect_to '/'
    else
      render 'new'
    end
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :admin)
    end

    def key_validation
      if params[:user][:admin] == "1"
        if params[:key] == SecretKey.first.admin_key
          true
        else
          @user.errors.add(:key, "Invalid")
          false
        end
      else
        if params[:key] == SecretKey.first.user_key
          true
        else
          @user.errors.add(:key, "Invalid")
          false
        end
      end
    end
end
