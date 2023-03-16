class TasksController < ApplicationController
  def home

    @tasks = Task.all.order('due_date DESC, importance')
  end

  def new
    @task = Task.new
  end

  def create
    # raise
    @task = Task.new(task_params)

    if @task.save
      redirect_to @task, notice: "Task submitted successfully."
    else
      render :new
    end
  end

  private

  def task_params
    params.require(:task).permit(:content)
  end
end
