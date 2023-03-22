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
      # ADD ERROR POP-UP HERE
      #   render :edit
    end
  end

  def destroy
    @task = Task.find(params[:id])
    if @task.destroy
      redirect_to root_path
    end
    # delete subtasks
  end

  private

  def task_params
    params.require(:task).permit(:content, :reason, :due_date, :importance, :difficulty, :contact )
  end
end
