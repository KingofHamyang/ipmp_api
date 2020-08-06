class UsersController < ApplicationController
  before_action :get_student, only: [:index, :create]
  before_action :get_user, only: [:show, :destroy, :update]

  def index
    if @student
      render json: @student.users
    else
      render json: Student.all
    end
  end

  def create
    @user = @student.users.create!(user_params)
    render json: @user
  end

  def show
    render json: @user
  end

  def update
    @user.update(user_params)
    render json: @user
  end

  def destroy
    @user.destroy
    render json: @user
  end

  private

  def user_params
    params.require(:user).permit(:password, :student_id, :account)
  end

  def get_user
    @user = User.find(params[:id])
  end

  def get_student
    if params[:student_id]
      @student = Student.find(params[:student_id])
    else
      @student = nil
    end
  end
end