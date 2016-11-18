class FinalGroup < ApplicationRecord
  validates_presence_of :student_id, :pitch_id
  validates_uniqueness_of :student_id, { scope: :pitch_id, message: "only one final group per user" }

  belongs_to :student, class_name: User
  belongs_to :pitch
  has_one :leader, through: :pitch, source: :student
end
