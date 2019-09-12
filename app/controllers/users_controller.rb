class UsersController < ApplicationController
  
  before_action :url_confirmation_signup_page, only: :new
  
  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = '新規作成に成功しました。'
      redirect_to @user
    else
      render :new
    end
  end
  
  def index
  end
  
  def url_confirmation_signup_page
    if current_user && !current_user.admin?
      flash[:danger] = "一般ユーザーの閲覧はできません。"
      redirect_to root_url
    end
  end
  
  private
  
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
