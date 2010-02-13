class MyTasksController < ApplicationController
  # GET /my_tasks
  def index
    @user = session[:user]
    @my_tasks        = find_tasks_by_assignee(@user)
    @available_tasks = find_tasks_by_assignee(nil)

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /my_tasks/take/:id
  def take
    @task = Task.find(params[:id])
    @task.assignee = session[:user]
    
    if @task.save then
      flash[:notice] = 'Task assigned to you!'
    else
      flash[:warning] = 'Unable to assign task to you!'
    end

    respond_to do |format|
        format.html { redirect_to :action => "index" }
    end
  end

  # GET /my_tasks/drop/:id
  def drop
    @task = Task.find(params[:id])
    @task.assignee = nil
    
    if @task.save then
      flash[:notice] = 'Task dropped!'
    else
      flash[:warning] = 'Unable to drop task!'
    end

    respond_to do |format|
        format.html { redirect_to :action => "index" }
    end
  end
    
  def find_tasks_by_assignee(assignee)
    Task.find(:all, :conditions => { :assignee_id => assignee })
  end
end
