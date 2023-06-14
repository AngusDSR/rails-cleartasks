  class SubtasksController < ApplicationController
    before_action :set_task, only: %i[create update destroy]

    def create
      @subtask = Subtask.new(subtask_params)
      @subtask.task = @task

      if @subtask.save
        render json: { success: true }
      else
        render json: { success: false, errors: @subtask.errors.full_messages }
      end
    end

    def update
      @task = Task.find(params[:task_id])
      @subtask = @task.subtasks.find(params[:id])
      @subtask.completion = params[:subtask][:completion] == '1'

      if @subtask.save
        render json: { success: true }
      else
        render json: { success: false, errors: @subtask.errors.full_messages }
      end
    end

    def destroy
      @subtask = Subtask.find(params[:id])
      # @subtask.destroy
      if @subtask.destroy
        redirect_to root_path, status: :see_other
        # render json: { success: true }
      else
        render json: { success: false, errors: @subtask.errors.full_messages }
      end
      # redirect_to root_path
    end

    private

    def subtask_params
      params.require(:subtask).permit(:content, :completion)
    end

    def set_task
      @task = Task.find(params[:task_id])
    end
  end
