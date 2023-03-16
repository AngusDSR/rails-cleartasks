class TasksController < ApplicationController
  def home
    @tasks = Task.all.order('due_date DESC, importance')
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.save!
    # if @task.save
    #   # tbc
    #   # redirect_to tasks_new_path,
    #   notice: "Task submitted successfully."
    # else
    #   render :nee
    # end
  end

  private

  def task_params
    params.require(:task).permit(:content)
  end
end
