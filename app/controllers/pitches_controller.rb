class PitchesController < ApplicationController

  def index
    @pitches = Pitch.all
  end

  def new
    @pitch = Pitch.new
  end

  def create
    @pitch = Pitch.new(pitch_params)
    if current_user.pitches.length < 4
      if @pitch.save
        flash[:notice] = "Thank you for adding a new pitch! Don't forget to vote!"
        redirect_to root_path #????
      else
        render 'new'
      end
    else
      flash[:notice] = "User have too much pitches for user"
      redirect_to root_path
    end
  end

  def show
    @pitch = Pitch.find_by(id: params[:id])
  end

  private
    def pitch_params
      params.require(:pitch).permit(:title, :body)
    end

end
