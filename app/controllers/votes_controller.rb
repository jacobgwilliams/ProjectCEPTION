class VotesController < ApplicationController
  def create
    require_login
    @pitch = Pitch.find_by(id: params[:pitch_id])
    if @pitch && has_votes_left?
      @vote = Vote.new(pitch: @pitch, student: current_user)
      if @vote.save
        flash[:notice] = 'Your vote was recorded'
      else
        flash[:notice] = 'Invalid vote'
      end
      redirect_to @pitch
    else
      flash[:notice] = 'You have reached the max number of votes'
      redirect_to root_path
    end
  end

  def has_votes_left?
    if current_user.votes.count < 7
      true
    else
      false
    end
  end

end
