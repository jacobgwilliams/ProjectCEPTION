class FinalGroupsController < ApplicationController

  def index
    @final_groups = FinalGroup.select("pitch_id").group("pitch_id")
  end

  def new
  end

  def create
  end

  def show
  end

end
