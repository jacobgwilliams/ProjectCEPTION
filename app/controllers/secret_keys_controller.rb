class SecretKeysController < ApplicationController
  def new
    require_login
    require_admin
    @secret_keys = SecretKey.new
  end

  def create
    require_login
    require_admin
    @secret_keys = SecretKey.new(secret_key_params)
    if @secret_keys.save
      flash[:notice] = "New keys saved."
      redirect_to '/'
    else
      flash[:notice] = "Sorry - keys could not be saved."
      render 'new'
    end
  end

  private
    def secret_key_params
      params.require(:secret_key).permit(:user_key, :admin_key)
    end
end
