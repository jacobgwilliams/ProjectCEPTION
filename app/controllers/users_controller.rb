class UsersController < ApplicationController
  def new
    require_not_logged_in
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if key_validation && @user.save
      flash[:notice] = "Thank you for creating an account! Please login below."
      redirect_to '/'
    else
      render 'new'
    end
  end

  def show
    require_login
    require_admin
    @user = User.find_by(id: params[:id])
    if round_two?
      advancing_pitches = Pitch.where(advancing: true)
      @pitches = advancing_pitches.sort_by(&:total_ranking)
    else
      @pitches = Pitch.all.sort_by(&:vote_count).reverse
    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :admin)
    end

    def key_validation
      if params[:user][:admin] == "1"
        if params[:key] == SecretKey.last.admin_key #.last ensures the key is the most up to date key
          true
        else
          @user.errors.add(:key, "Invalid")
          false
        end
      else
        if params[:key] == SecretKey.last.user_key #same as above
          true
        else
          @user.errors.add(:key, "Invalid")
          false
        end
      end
    end
end
