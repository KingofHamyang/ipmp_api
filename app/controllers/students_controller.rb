class StudentsController < ApplicationController
  before_action :get_team, only: [:index, :create]
  before_action :get_student, only: [:show, :destroy, :update]

  def index
    if @team
      render json: @team.students
    else
      render json: Student.all
    end
  end

  def create
    @student = @team.students.create!(student_params)
    render json: @student
  end

  def show
    render json: @student
  end

  def update
    @student.update(student_params)
    render json: @student
  end

  def destroy
    @student.destroy
    render json: @student
  end

  private

  def student_params
    params.require(:student).permit(:name, :team_id, :phone)
  end

  def get_student
    @student = Student.find(params[:id])
  end

  def get_team
    if params[:team_id]
      @team = Team.find(params[:team_id])
    else
      @team = nil
    end
  end
end