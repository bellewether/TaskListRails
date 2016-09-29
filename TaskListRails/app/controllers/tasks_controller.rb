class TasksController < ApplicationController
  def index
     @tasks = Task.all
  end

  def show # should render a new view for the user
     @task = Task.find(params[:id])
  end

end
