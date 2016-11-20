class FinalGroupsController < ApplicationController

  def index
    @final_groups = FinalGroup.select("pitch_id").distinct
  end

  def new
    require_login
    require_admin
    final_group_protection #will currently redirect admin to '/' if the pitch has already been made into a final group
    final_project_cap_redirect
    @final_group = FinalGroup.new(pitch_id: params[:pitch_id])
    @students = final_group_selection_listing
  end

  def create_groups
    require_login
    require_admin
    # @final_group = FinalGroup.new(pitch_id: params[:pitch_id])
    params[:group_members].each do |useless_key, member_id|
      FinalGroup.create(pitch_id: params[:pitch_id], student_id: member_id)
    end
    flash[:notice] = 'That was a great group you just created'
    redirect_to current_user
  end

  def final_group_created(pitch)
    pitch.final_group
  end

  def final_group_protection
    if final_group_created(Pitch.find_by(id: params[:pitch_id]))
      redirect_to '/'
    end
  end

  def is_group_leader?(student, pitch)
    pitch.student == student ? true : false
  end

  def leaders_already
    FinalGroup.all.map(&:leader)
  end

  def final_group_selection_listing
    users = User.where(admin: false)
    users = users.find_all {|user| user.final_group == nil }
    users = users.delete_if {|user| leaders_already.include?(user) }
  end

  def final_project_cap_met
    Pitch.all.find_all(&:final_group).count >= 3
  end

  def final_project_cap_redirect
    redirect_to final_groups_path if final_project_cap_met
  end
end
