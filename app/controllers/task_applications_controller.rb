class TaskApplicationsController < ApplicationController
  before_action :set_task_application, only: %i[ show edit update destroy ]

  # GET /applications or /applications.json 
  # Shows only the applications that the user has posted
  def index
    @task_applications = TaskApplication.where(:user_id => current_user.id )
  end

  # GET /applications/1 or /applications/1.json
  def show
  end

  # GET /applications/new
  def new
    @task_application = TaskApplication.new
    @task = Task.find(params[:task_id])
  end

  # GET /applications/1/edit
  def edit
  end

  # POST /applications or /applications.json
  def create
    @task_application = TaskApplication.find_by_user_id_and_task_id(params[:task_application][:user_id], params[:task_application][:task_id])
    if !@task_application.nil?
      redirect_to @task_application, alert: "You've already applied for this job."
    else
      @task_application = TaskApplication.new(task_application_params)
      respond_to do |format|
        if @task_application.save
          format.html { redirect_to @task_application, notice: "Application was successfully created." }
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
      format.html { redirect_to task_applications_url, notice: "Application was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task_application
      @task_application = TaskApplication.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def task_application_params
      params.require(:task_application).permit(:message, :user_id, :task_id, :task_date)
    end
end
