class PitchRankingsController < ApplicationController
  def create_ranking
    require_login
    params[:pitch_rankings].each do |pitch_id, ranking|
      PitchRanking.create(pitch_id: pitch_id, ranking: ranking, student: current_user)
    end
    redirect_to root_path
  end
end
