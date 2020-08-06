class VrsController < ApplicationController
  before_action :get_team, only: [:index, :create]
  before_action :get_vr, only: [:show, :destroy, :update, :voting]
  before_action :get_user, only: [:voting]

  def index
    if @team
      render json: @team.vrs
    else
      render json: Vr.all
    end
  end

  def create
    @vr = @team.vrs.create!(vr_params)
    render json: @vr
  end

  def show
    render json: @vr
  end

  def update
    @vr.update(vr_params)
    render json: @vr
  end

  def destroy
    @vr.destroy
    render json: @vr
  end

  def voting
    begin
      @vr_vote = VrVote.create!(vr: @vr, user: @user)
      vote = @vr.vote + 1
      @vr.update(vote: vote)
      render json: @vr_vote
    rescue ActiveRecord::RecordInvalid
      raise "This user already vote to this vr"
    end
  end

  private

  def vr_params
    params.require(:vr).permit(:link, :team_id, :vote)
  end

  def get_user
    @user = User.find(params[:user_id])
  end

  def get_vr
    @vr = Vr.find(params[:id])
  end

  def get_team
    if params[:team_id]
      @team = Team.find(params[:team_id])
    else
      @team = nil
    end
  end
end