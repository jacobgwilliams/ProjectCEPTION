class FinalGroupsController < ApplicationController

  def index
    @final_groups = FinalGroup.select("pitch_id").distinct
  end

  def new
    require_login
    require_admin
    final_group_protection
    @final_group = FinalGroup.new(pitch_id: params[:pitch_id])
    @students = User.where(admin: false)
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

end
