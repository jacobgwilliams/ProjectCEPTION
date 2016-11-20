module FinalGroupsHelper
  def is_group_leader?(student, pitch)
    pitch.student == student ? true : false
  end

  def leaders_already
    FinalGroup.all.map(&:leader)
  end

  def final_project_cap_met
    Pitch.all.find_all(&:final_group).count >= 3
  end
end
