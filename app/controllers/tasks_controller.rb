class TasksController < ApplicationController
  def index
    @task = Task.all
    @tasks_title = [
      "タスク１",
      "タスク２",
      "タスク３"
      ]
  end
end
