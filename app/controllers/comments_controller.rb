class CommentsController < ApplicationController

  def create
    @task = Task.find(params[:task_id])
    @comment = @task.comments.build(comment_params)
    @comment.user_id = current_user.id
    respond_to do |format|
      if @comment.save
          format.html { redirect_to @task, notice: 'Post was 
          successfully commented.' }
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
		@task = Task.find(params[:task_id])
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

