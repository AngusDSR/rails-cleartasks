  class SubtasksController < ApplicationController
    before_action :set_task, only: %i[create update destroy]

    def create
      @subtask = Subtask.new(subtask_params)
      @subtask.task = @task

      if @subtask.save
        redirect_to request.referer
      else
        flash[:error] = "Subtask #{@subtask.errors[:content].last}" unless @subtask.save
        redirect_to :root
      end
    end

    def update
      @task = Task.find(params[:task_id])
      @subtask = @task.subtasks.find(params[:id])
      @subtask.completion = params[:subtask][:completion] == '1'
      if @subtask.save
        redirect_to request.referer, status: :see_other
      else
        # this needs to be a modal
        render json: { success: false, errors: @subtask.errors.full_messages }
      end
    end

    def destroy
      @subtask = Subtask.find(params[:id])
      if @subtask.destroy
        redirect_to request.referer, status: :see_other
      else
        # this needs to be a modal
        render json: { success: false, errors: @subtask.errors.full_messages }
      end
    end

    private

    def subtask_params
      params.require(:subtask).permit(:content, :completion)
    end

    def set_task
      @task = Task.find(params[:task_id])
    end
  end
