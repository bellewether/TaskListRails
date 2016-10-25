class TasksController < ApplicationController
  before_action :find_task, only: [:show, :edit, :update]

  def index
     @tasks = @current_user.tasks
  end

  def show; end

  def new
    @task = Task.new
  end

  def edit; end

  def create
    @task = Task.new(task_params)
    @task.user_id = session[:user_id]

    if task_params[:completion_status]
      task_params[:completion_status] = true
    else
      task_params[:completion_status] = false
    end

    if @task.save
      redirect_to tasks_path
    else
      render :new
    end

  end

  def update
    if @task.update(task_params)
      # SUCCESS
      redirect_to tasks_path
    else
      # UNSUCCESSFUL
      render :edit
    end
  end

  def destroy
    Task.find(params[:id]).destroy
    redirect_to tasks_path
  end

  private

  def task_params
    params.require(:task).permit(:name, :description, :completion_status, :completed_at, :user_id)
  end

  def find_task
      begin
        @task = @current_user.tasks.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        render file: "public/404", status: :not_found
      end
    end
end
