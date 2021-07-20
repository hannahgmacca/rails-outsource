class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
		@task = Task.find(params[:task_id])
	 	@comment = @task.comments.create(params[:comment].permit(:message))
    @comment.user_id = current_user.id
		redirect_to task_path(@task)	
  end

	def destroy
		@task = Task.find(params[:task_id])
		@comment = @task.comments.find(params[:id])
		@comment.destroy
		redirect_to task_path(@task)
	end

end