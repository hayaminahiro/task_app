class TasksController < ApplicationController

  before_action :admin_or_correct_user, only: [:index, :new, :edit, :update]

  def index
    @user = User.find(params[:user_id])
    @tasks = @user.tasks.order(created_at: "DESC")
    # @task = Task.find(params[:user_id])

  end

  def show
    @user = User.find(params[:user_id])
    @task = @user.tasks.find(params[:id])
    @tasks = @user.tasks
    # debugger
  end

  def new
    @user = User.find(params[:user_id])
    @task = Task.new
  end

  def create
    @user = User.find(params[:user_id])
    @task = @user.tasks.new(task_params)
    if @task.save
      flash[:success] = "タスクを新規作成しました。"
      redirect_to user_tasks_url
    else
      render "new"
    end
  end

  def edit
    @user = User.find(params[:user_id])
    @task = @user.tasks.find(params[:id])
  end

  def update
    @user = User.find(params[:user_id])
    @task = @user.tasks.find(params[:id])
    if @task.update_attributes(task_params)
      flash[:success] = "タスクを更新しました。"
      redirect_to user_tasks_url
    else
      render "edit"
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    @task = @user.tasks.find(params[:id])
    if @task.destroy
      flash[:danger] = "「#{@task.task_title}」を削除しました。"
      redirect_to user_tasks_url
    end

  end

  private

    def task_params
      params.require(:task).permit(:id, :user_id, :task_title, :task_details)
    end

    # 管理権限者、または現在ログインしているユーザーを許可します。
    # user_idをparamsで取得しているので、Userとリレーションのあるモデルでのバリデーション
    def admin_or_correct_user
      @user = User.find(params[:user_id]) if @user.blank?
      unless current_user?(@user) || current_user.admin?
        flash[:danger] = "権限がありません。"
        redirect_to(root_url)
      end
    end

end
