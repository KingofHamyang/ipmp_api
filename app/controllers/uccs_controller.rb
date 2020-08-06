class UccsController < ApplicationController
  before_action :get_team, only: [:index, :create]
  before_action :get_ucc, only: [:show, :destroy, :update, :voting]
  before_action :get_user, only: [:voting]

  def index
    if @team
      render json: @team.uccs
    else
      render json: Ucc.all
    end
  end

  def get_by_keyword
    keyword_schools = School.where("name like ?", "%#{params[:keyword]}%")
    keyword_teams = Team.where("name like ?", "%#{params[:keyword]}%")

    matched_teams = (keyword_schools.map(&:teams).flatten.uniq + keyword_teams).uniq

    @uccs = matched_teams.map(&:uccs).flatten.uniq
    render json: @uccs
  end

  def create
    @ucc = @team.uccs.create!(ucc_params)
    render json: @ucc
  end

  def show
    render json: @ucc
  end

  def update
    @ucc.update(ucc_params)
    render json: @ucc
  end

  def destroy
    @ucc.destroy
    render json: @ucc
  end

  def voting
    begin
      @ucc_vote = UccVote.create!(ucc: @ucc, user: @user)
      vote = @ucc.vote + 1
      @ucc.update(vote: vote)
      render json: @ucc_vote
    rescue ActiveRecord::RecordInvalid
      raise "This user already vote to this ucc"
    end
  end

  private

  def ucc_params
    params.require(:ucc).permit(:link, :team_id, :title, :descriptioin, :vote)
  end

  def get_user
    @user = User.find(params[:user_id])
  end

  def get_ucc
    @ucc = Ucc.find(params[:id])
  end

  def get_team
    if params[:team_id]
      @team = Team.find(params[:team_id])
    else
      @team = nil
    end
  end
end