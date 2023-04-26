class SubtasksController < ApplicationController

  before_action :set_task, only: %i[new destroy create]

  def new
    @subtask = Subtask.new
  end

  def create
    @subtask = Subtask.new(subtask_params)
    @subtask.task = @task
    @subtask.save
  end

  def destroy

  end

  private

  def subtask_params
    params.require(:subtask).permit(:content, :completed)
  end

  def set_task
    @task = params[:subtask][:task_id]
  end
end
