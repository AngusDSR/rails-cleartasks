class PagesController < ApplicationController
  def home
    @tasks = Task.all.order('due_date DESC, importance')
  end

  def create
    @task = Task.new()
  end

  private

  def task_params
    # add parameters
  end
end
