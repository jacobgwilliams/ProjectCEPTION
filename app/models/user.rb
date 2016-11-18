class User < ApplicationRecord
  has_secure_password

  validates :email, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i }, presence: true
  validates :password, length: { minimum: 8, maximum: 100 }

  has_many :pitches, { foreign_key: :student_id }
  has_many :votes, { foreign_key: :student_id }
  has_many :pitch_rankings, { foreign_key: :student_id }
  has_one :final_group, { foreign_key: :student_id }
  has_one :final_project, { through: :final_group, source: :pitch }
  has_many :round_one_picks, { through: :votes, source: :pitch }
  has_many :round_two_picks, { through: :pitch_rankings, source: :pitch }


end
