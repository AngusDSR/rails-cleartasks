class SubtasksController < ApplicationController
  before_action :set_task, only: %i[create update destroy]

  def create
    @subtask = Subtask.new(subtask_params)
    @subtask.task = @task
    # this needs to popover without refreshing the page / validation in the form
    # Using AJAX and js
    flash[:error] = "Enter at least 5 characters" unless @subtask.save
    redirect_to root_path
  end

  def update
    # TO DO
  end

  def destroy
    @subtask = Subtask.find(params[:id])
    @subtask.destroy
    # raise
    redirect_to root_path
    # TO DO
  end

  private

  def subtask_params
    params.require(:subtask).permit(:content, :completed)
  end


  def set_task
    @task = Task.find(params[:task_id])
  end
end
