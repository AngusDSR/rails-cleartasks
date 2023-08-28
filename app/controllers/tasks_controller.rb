class TasksController < ApplicationController
  def index
    @new_task = Task.new
    @new_tasks = Task.where.not(content: nil).where(reason: [nil, '']).order(created_at: :desc)
                     .or(Task.where.not(content: nil).where(due_date: [nil, ''])).order(created_at: :desc)
                     .or(Task.where.not(content: nil).where(name: [nil, ''])).order(created_at: :desc)
    @tasks = Task.where.not(name: ['', nil], due_date: ['', nil], reason: ['', nil])
    @subtask = Subtask.new
  end

  def completed
    @tasks = Task.where(completion: true)
  end

  def create
    @task = Task.new(task_params)
    flash[:error] = "Enter at least 10 characters" unless @task.content.present? && @task.save
    redirect_to root_path
  end

  def edit
    # TO DO: Create modal, note view
    @task = Task.find(params[:id])
    @subtask = Subtask.new
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params.except("source_path"))
      redirect_to root_path
    else
      unless params[:task]["source_path"] == "/"
        render :edit, status: :unprocessable_entity
      end
    end
  end

  def mark_complete
    @task = Task.find(params[:id])
    @task.update(completion: true)
    # redirect_to @task, notice: 'Task marked as complete.'
  end

  def destroy
    @task = Task.find(params[:id])
    if @task.destroy
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  private

  def task_params
    params.require(:task).permit(:content, :name, :reason, :due_date, :importance, :completion, :source_path)
  end

  def subtask_params
    params.require(:task).permit(:content, :completion)
  end
end
