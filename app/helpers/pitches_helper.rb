module PitchesHelper
  def has_already_voted?(pitch)
    pitch.voters.include?(current_user) ? true : false
  end

  def has_already_ranked_pitches?
    !current_user.pitch_rankings.empty?
  end

  def find_ranking(pitch_to_find)
    PitchRanking.where(student: current_user).where(pitch: pitch_to_find).pluck(:ranking).first
  end

  def find_ranking_two(student_to_find, pitch_to_find)
    PitchRanking.where(student: student_to_find).where(pitch: pitch_to_find).pluck(:ranking).first
  end

  def final_group_created(pitch)
    pitch.final_group
  end

  def final_group_protection
    if final_group_created(Pitch.find_by(id: params[:pitch_id]))
      redirect_to '/'
    end
  end
end
