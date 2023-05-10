class SubtasksController < ApplicationController
  before_action :set_task, only: %i[create update destroy]
  # check syntax::
  # after_action redirect_to root_path, only: %i[create update destroy]

  def create
    @subtask = Subtask.new(subtask_params)
    @subtask.task = @task
    # this needs to popover without refreshing the page / validation in the form
    # Using AJAX and js
    flash[:error] = "Enter at least 5 characters" unless @subtask.save
    redirect_to root_path
  end

  def update
    # raise
    @subtask = Subtask.find(params[:id])
    @subtask.completion = true unless params[:subtask][:completion].to_i == 1
    redirect_to root_path
  end

  def destroy
    @subtask = Subtask.find(params[:id])
    @subtask.destroy
    redirect_to root_path
  end

  private

  def subtask_params
    params.require(:subtask).permit(:content, :completion)
  end

  def set_task
    @task = Task.find(params[:task_id])
  end
end
