class TasksController < ApplicationController
  ##### Non-standard actions #####

  # GET /tasks/my
  def my
    @my_tasks        = find_open_tasks_by_assignee(@current_user)
    @available_tasks = find_open_tasks_by_assignee(nil)

    respond_to do |format|
      format.html # my.html.erb
    end
  end

  # GET /tasks/1/audio
  def audio
    @task = Task.find(params[:id])
    send_data (@task.audio_description, :type => @task.audio_content_type, 
                                        :filename => "audio_description.wav", 
                                        :disposition => 'inline')
  end

  ##### Standard idempotent actions #####

  # GET /tasks
  # GET /tasks.xml
  def index
    @tasks = Task.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @tasks }
    end
  end

  # GET /tasks/1
  # GET /tasks/1.xml
  def show
    @task = Task.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @task }
    end
  end

  # GET /tasks/new
  # GET /tasks/new.xml
  def new
    @task = Task.new
    @types = Type.all
    @assignees = User.all
 
    respond_to do |format|
      format.html     # new.html.erb
      format.voicexml # new.voicexml.rxml
      format.xml      { render :xml => @task }
    end
  end

  # GET /tasks/1/edit
  def edit
    @task = Task.find(params[:id])
    @types = Type.all
    @assignees = User.all
  end

  ##### Standard data-modifying actions #####

  # POST /tasks
  # POST /tasks.xml
  def create
    @task = Task.new(params[:task])
    if params[:type_id]            then @task[:type_id]            = params[:type_id]            end
    if params[:audio_description]  then @task[:audio_description]  = params[:audio_description]  end
    if params[:audio_content_type] then @task[:audio_content_type] = params[:audio_content_type] end
    @types = Type.all
    @assignees = User.all

    respond_to do |format|
      if @task.save
        flash[:notice] = 'Task was successfully created.'
        format.html { redirect_to(@task) }
        format.xml  { render :xml => @task, :status => :created, :location => @task }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @task.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /tasks/1
  # PUT /tasks/1.xml
  def update
    @task = Task.find(params[:id])

    respond_to do |format|
      if @task.update_attributes(params[:task])
        flash[:notice] = 'Task was successfully updated.'
        format.html { redirect_to(@task) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @task.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.xml
  def destroy
    @task = Task.find(params[:id])
    @task.destroy

    respond_to do |format|
      format.html { redirect_to(tasks_url) }
      format.xml  { head :ok }
    end
  end

  private
    def find_open_tasks_by_assignee(assignee)
      Task.find(:all, :conditions => { :state => 'Open', :assignee_id => assignee })
    end
end
