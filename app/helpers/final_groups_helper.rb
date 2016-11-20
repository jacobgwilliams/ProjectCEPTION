module FinalGroupsHelper
  def is_group_leader?(student, pitch)
    pitch.student == student ? true : false
  end

  def leaders_already
    FinalGroup.all.map(&:leader)
  end
end
