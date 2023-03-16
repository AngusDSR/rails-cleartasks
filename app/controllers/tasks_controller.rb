class TasksController < ApplicationController

  def index
    @tasks = Task.all
    @new_task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to root_path
    else
      @tasks = Task.all
      render :index
    end
  end

  # def index
  #   @tasks = Task.all
  # end

  # def new
  #   @task = Task.new
  # end

  # def create
  #   @task = Task.new(task_params)

  #   if @task.save
  #     redirect_to root_path, notice: "Task submitted successfully."
  #   else
  #     render :new
  #   end
  # end

  private

  def task_params
    params.require(:task).permit(:content)
  end
end
