class Vote < ApplicationRecord
  validates_presence_of :student_id, :pitch_id
  validates_uniqueness_of :student_id, { scope: :pitch_id, message: "only one vote for you, user!" }

  belongs_to :student, class_name: User
  belongs_to :pitch
end
