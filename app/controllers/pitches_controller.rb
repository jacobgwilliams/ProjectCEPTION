class PitchesController < ApplicationController

  def index
    @pitches = Pitch.all
  end

  def new
  end

  def create
  end

  def show
    @pitch = Pitch.find_by(id: params[:id])
  end

end
