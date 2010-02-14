class MyTasksController < ApplicationController
  # GET /my_tasks
  def index
    @my_tasks        = find_tasks_by_assignee(@current_user)
    @available_tasks = find_tasks_by_assignee(nil)

    respond_to do |format|
      format.html # index.html.erb
    end
  end
    
  private
    def find_tasks_by_assignee(assignee)
      Task.find(:all, :conditions => { :assignee_id => assignee })
    end
end
