class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def edit

  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to admin_dashboard_path, notice: "User created successfully."
    else
      render :new
    end
  end

  def show
  end

  def update
    if @user.update(user_params)
      redirect_to admin_dashboard_path, notice: "User updated successfully."
    else
      render :edit
    end
  end
    private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :role, :password, :password_confirmation)
  end

  def destroy
    @user.destroy
    redirect_to admin_dashboard_path, notice: "User deleted successfully."
  end
  
  def require_admin
    redirect_to root_path, alert: "Access denied" unless current_user.admin?
  end
end
