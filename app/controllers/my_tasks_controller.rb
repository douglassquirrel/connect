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
    
  def find_tasks_by_assignee(assignee)
    Task.find(:all, :conditions => { :assignee_id => assignee })
  end
end
