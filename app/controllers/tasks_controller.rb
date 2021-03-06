class TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :setup_form, only: [:new, :edit]
  before_action :set_task, only: %i[ show edit update destroy toggle_favorite ]
  before_action :current_user, only: %i[create destroy ]

  # GET /tasks or /tasks.json 
  def index
    @categories = Category.all

    # Only show tasks that are not sourced and are not posted by the user
    # Filter by Category
    if !params[:category_id].blank?
      @tasks = Task.by_category(params[:category_id])
      .where.not(:user_id => current_user.id).where(sourced: [nil, false ]).page params[:page]
    else
      @tasks = Task.where.not(:user_id => current_user.id).where(sourced: [nil, false ]).page params[:page]
    end
  end

  # GET /tasks/1 or /tasks/1.json
  def show
    respond_to do |format|
      format.html { render :show }
      format.json { render json: @task}
    end
  end

  # GET /tasks/new
  def new
    @task = Task.new
  end

  # GET /tasks/1/edit
  # If user is creator OR Admin
  def edit
    authorize @task
  end

  # POST /tasks or /tasks.json
  def create
    @task = Task.new(task_params)
    @task.user_id = current_user.id
    respond_to do |format|
      if @task.save
        format.html { redirect_to @task, notice: "Task was successfully created." }
        format.json { render :show, status: :created, location: @task }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tasks/1 or /tasks/1.json
  # If user is creator OR Admin
  def update
    authorize @task
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to @task, notice: "Task was successfully updated." }
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1 or /tasks/1.json
  # If user is creator OR Admin
  def destroy
    authorize @task
    @task.destroy
    respond_to do |format|
      format.html { redirect_to tasks_url, notice: "Task was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  # Toggle favourite on / favourite off 
  def toggle_favorite
    current_user.favorited?(@task) ? current_user.unfavorite(@task) : current_user.favorite(@task)
  end

  # List tasks user has favourited
  def favourites
    @favourite_tasks = current_user.favorited_by_type('Task')
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    def setup_form
      @categories = Category.all
    end

    # Only allow a list of trusted parameters through.
    def task_params
      params.require(:task).permit(:title, :description, :price, :user_id, :category_id, :comment, :task_date, :sourced, :remote_work)
    end

end
