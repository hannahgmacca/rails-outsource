class CommentsController < ApplicationController
  before_action :set_task, only: %i[update destroy create]
  before_action :set_comment, only: %i[update destroy]
  before_action :authenticate_user!, only: %i[create destroy]
  before_action :current_user, only: %i[create destroy]

  def create
    @comment = @task.comments.build(comment_params)
    @comment.user_id = current_user.id
    respond_to do |format|
      if @comment.save
          format.html { redirect_to @task }
          format.json { render :show, status: :created, 
      location: @task }
      else
          format.html { redirect_to @task, alert: 'post not 
          commented' }
          format.json { render json: @task.errors, status: 
          :unprocessable_entity }
      end
    end
  end

	def destroy
		@comment = @task.comments.find(params[:id])
		@comment.destroy
		redirect_to task_path(@task)
	end

  private

  def comment_params
    params.require(:comment).permit(:message, :task_id)
  end

  def set_task
    @task = Task.find(params[:task_id])
  end

  def set_comment
    @comment = @task.comments.find(params[:id])
  end

end

