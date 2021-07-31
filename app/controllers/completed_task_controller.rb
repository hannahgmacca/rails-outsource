class CompletedTasksController < ApplicationController
  before_action :set_completed_task, only: %i[ show edit update destroy ]

  # GET /task_completes or /task_completes.json
  def index
    @completed_task = CompletedTask.all
  end

  # GET /task_completes/1 or /task_completes/1.json
  def show
  end

  # GET /task_completes/new
  def new
    @completed_task = CompletedTask.new
  end

  # GET /task_completes/1/edit
  def edit
  end

  # POST /task_completes or /task_completes.json
  def create
    @completed_task = CompletedTask.new(completed_task_params)

    respond_to do |format|
      if @completed_task.save
        format.html { redirect_to @completed_task, notice: "Task complete was successfully created." }
        format.json { render :show, status: :created, location: @completed_task }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @completed_task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /task_completes/1 or /task_completes/1.json
  def update
    respond_to do |format|
      if @completed_task.update(completed_task_params)
        format.html { redirect_to @completed_task, notice: "Task complete was successfully updated." }
        format.json { render :show, status: :ok, location: @completed_task }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @completed_task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /task_completes/1 or /task_completes/1.json
  def destroy
    @completed_task.destroy
    respond_to do |format|
      format.html { redirect_to completed_task_url, notice: "Task complete was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_completed_task
      @completed_task = CompletedTask.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def completed_task_params
      params.require(:completed_task).permit(:message, :user_id, :task_id, :task_date)
    end
end
