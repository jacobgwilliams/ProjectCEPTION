class FinalGroupsController < ApplicationController

  def index
    @final_groups = FinalGroup.select("pitch_id").distinct
  end

  def new
    @final_group = FinalGroup.new(pitch_id: params[:pitch_id])
  end

  def create
  end

  def show
  end

end
