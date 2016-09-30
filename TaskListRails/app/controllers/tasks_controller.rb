class TasksController < ApplicationController
  def index
     @tasks = Task.all
  end

  def show # should render a new view for the user
     @task = Task.find(params[:id])
  end

  def new # add a new task!
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)

    if @task.save
      #SAVED SUCCESSFULLY
      redirect_to tasks_path
    else
      #DID NOT SAVE
      render :new
    end
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      # SUCCESS
      redirect_to tasks_path
    else
      render :edit
    end
  end

  private

  def task_params
    params.require(:task).permit(:name, :description, :completed_at)
  end
end
