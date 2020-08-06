class TeamsController < ApplicationController
  before_action :get_school, only: [:index, :create]
  before_action :get_team, only: [:show, :destroy, :update]

  def index
    if @school
      render json: @school.teams
    else
      render json: Team.all
    end
  end

  def create
    @team = @school.teams.create!(team_params)
    render json: @team
  end

  def show
    render json: @team
  end

  def update
    @team.update(team_params)
    render json: @team
  end

  def destroy
    @team.destroy
    render json: @team
  end

  private

  def team_params
    params.require(:team).permit(:name, :school_id)
  end

  def get_team
    @team = Team.find(params[:id])
  end

  def get_school
    if params[:school_id]
      @school = School.find(params[:school_id])
    else
      @school = nil
    end
  end
end