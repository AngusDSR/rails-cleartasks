class TasksController < ApplicationController

  def index
    @tasks = Task.all.order(created_at: :desc)
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

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      redirect_to root_path
    # else
    #   render :edit
    end
  end

  private

  def task_params
    params.require(:task).permit(:content, :reason, :due_date, :importance, :difficulty, :contact )
  end
end
