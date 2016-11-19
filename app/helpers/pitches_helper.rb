module PitchesHelper
  def has_already_voted?(pitch)
    pitch.voters.include?(current_user) ? true : false
  end
end
