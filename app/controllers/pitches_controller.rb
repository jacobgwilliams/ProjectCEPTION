class PitchesController < ApplicationController

  def index
    require_login
    if is_admin?
      @pitches = Pitch.joins(:votes).group("pitches.id").order("count(votes.id) desc")
    else
      @pitches = Pitch.all
    end

    if round_two?
      # must include all pitches because pitches without votes will not show up
      @pitches = Pitch.where(advancing: true)
    end

  end

  def new
    require_login
    @pitch = Pitch.new
  end

  def create
    require_login
    @pitch = Pitch.new(pitch_params)
    @pitch.student = current_user
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
    require_login
    @pitch = Pitch.find_by(id: params[:id])
  end

  def edit
    require_login
    @pitch = Pitch.find_by(id: params[:id])
  end

  def update
    require_admin
    if !round_two_maximum_met
      @pitch = Pitch.find_by(id: params[:id])
      @pitch.advancing = true
      @pitch.save
      flash[:notice] = "#{@pitch.title} has advanced to Round 2! May the odds be ever in their favor!"
      redirect_to "/users/#{current_user.id}"
    else
      flash[:notice] = "Maximum number of pitches advanced."
      redirect_to "/users/#{current_user.id}"
    end
  end

  private
    def pitch_params
      params.require(:pitch).permit(:title, :body)
    end

end
