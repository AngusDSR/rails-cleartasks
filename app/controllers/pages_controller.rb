class PagesController < ApplicationController
  def home
    @tasks = Task.all.order('due_date DESC, importance')
  end
end
