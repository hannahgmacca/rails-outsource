class HomeController < ApplicationController
  def index
  end

  def to_be_approved
      @task_applications = TaskApplication.joins(:task).where(tasks: {user_id: current_user, sourced: false})
  end

  def archived_tasks
      
  end

  def user_profile

  end
end
