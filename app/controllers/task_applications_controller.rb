class TaskApplicationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_task_application, only: %i[ show edit update destroy ]

  # GET /applications or /applications.json 
  def index
     # Applications that the  current user has posted
    @task_applications = TaskApplication.where(:user_id => current_user.id )
  end

  # GET /applications/1 or /applications/1.json
  def show
  end

  # Retrieve tasks posted by this user that
  # 1. haven't been declined 
  # 2. Haven't been sourced yet. 
  def pending_approval
    @task_applications = TaskApplication.joins(:task).where(tasks: { user_id: current_user, sourced: nil}, :approved => nil)

  end

  # GET /applications/new
  def new
    # new task with task ID from task being applied to
    @task_application = TaskApplication.new
    @task = Task.find(params[:task_id])
  end

  # GET /applications/1/edit
  def edit
  end


  # POST /applications or /applications.json
  def create
    # Checks if this task is already applied for
    @task_application = TaskApplication.find_by_user_id_and_task_id(params[:task_application][:user_id], params[:task_application][:task_id])
    if !@task_application.nil?
      redirect_to @task_application, alert: "You've already applied for this task."
    else
      @task_application = TaskApplication.new(task_application_params)
      respond_to do |format|
        if @task_application.save
          format.html { redirect_to task_applications_path, notice: "Application was successfully created." }
          format.json { render :show, status: :created, location: @task_application }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @task_application.errors, status: :unprocessable_entity }
        end
      end
    end
  end


  # PATCH/PUT /applications/1 or /applications/1.json
  def update
    respond_to do |format|
      if @task_application.update(task_application_params)
        format.html { redirect_to @task_application, notice: "Application was successfully updated." }
        format.json { render :show, status: :ok, location: @task_application }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @task_application.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /applications/1 or /applications/1.json
  def destroy
    @task_application.destroy
    respond_to do |format|
      format.html { redirect_to pending_approval_path, notice: "Application was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def approve_task_application
    # find task that is being approved
    application = TaskApplication.find(params[:task_application_id])
    approved_task = Task.find(application.task.id)
    # set task to sourced
    approved_task.sourced = true
    # set application to approved
    application.approved = true
    respond_to do |format|
      if application.save && approved_task.save
        format.html { redirect_to profile_path(application.user), notice: "Task was successfully approved!" }
        format.json { render :show, status: :created, location: approved_task }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: approved_task.errors, status: :unprocessable_entity }
      end
    end
  end

  def decline
    @task_application = TaskApplication.find(params[:task_application_id])
    @task_application.approved = false
    if @task_application.save
      respond_to do |format|
        format.html { redirect_to pending_approval_path, notice: "Application was successfully declined" }
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task_application
      @task_application = TaskApplication.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def task_application_params
      params.require(:task_application).permit(:message, :user_id, :task_id)
    end
end
