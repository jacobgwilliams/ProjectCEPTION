module FinalGroupsHelper
  def is_group_leader?(student, pitch)
    pitch.student == student ? true : false
  end
end
