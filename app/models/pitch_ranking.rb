class PitchRanking < ApplicationRecord
  validates_presence_of :student_id, :pitch_id, :ranking
  validates_uniqueness_of :student_id, { scope: :pitch_id, message: "only one ranking per pitch" }
  validates_inclusion_of :ranking, :in => 1..5

  belongs_to :student, class_name: User
  belongs_to :pitch
end
