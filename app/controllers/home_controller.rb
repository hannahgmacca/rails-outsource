class HomeController < ApplicationController
  def index
  end

  def approved_tasks
      @task_applications = TaskApplication.joins(:task).where(tasks: {user_id: current_user, sourced: false})
  end

  def archived_tasks
      
  end
end
