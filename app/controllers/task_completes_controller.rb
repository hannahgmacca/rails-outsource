class TaskCompletesController < ApplicationController
  before_action :set_task_complete, only: %i[ show edit update destroy ]

  # GET /task_completes or /task_completes.json
  def index
    @task_completes = TaskComplete.all
  end

  # GET /task_completes/1 or /task_completes/1.json
  def show
  end

  # GET /task_completes/new
  def new
    @task_complete = TaskComplete.new
  end

  # GET /task_completes/1/edit
  def edit
  end

  # POST /task_completes or /task_completes.json
  def create
    @task_complete = TaskComplete.new(task_complete_params)

    respond_to do |format|
      if @task_complete.save
        format.html { redirect_to @task_complete, notice: "Task complete was successfully created." }
        format.json { render :show, status: :created, location: @task_complete }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @task_complete.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /task_completes/1 or /task_completes/1.json
  def update
    respond_to do |format|
      if @task_complete.update(task_complete_params)
        format.html { redirect_to @task_complete, notice: "Task complete was successfully updated." }
        format.json { render :show, status: :ok, location: @task_complete }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @task_complete.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /task_completes/1 or /task_completes/1.json
  def destroy
    @task_complete.destroy
    respond_to do |format|
      format.html { redirect_to task_completes_url, notice: "Task complete was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task_complete
      @task_complete = TaskComplete.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def task_complete_params
      params.fetch(:task_complete, {})
    end
end
