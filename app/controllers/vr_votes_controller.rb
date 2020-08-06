class VrVotesController < ApplicationController
  before_action :get_vr, only: [:index, :create]
  before_action :get_user, only: [:index, :create]
  before_action :get_vr_vote, only: [:show, :destroy, :update]

  def index
    if @vr
      render json: @vr.vr_votes
    elsif @user
      render json: @vr.vr_votes
    else
      render json: VrVote.all
    end
  end

  def show
    render json: @vr_vote
  end

  private

  def get_user
    if params[:user_id]
      @user = User.find(params[:user_id])
    else
      @user = nil
    end
  end

  def get_vr_vote
    @vr_vote = VrVote.find(params[:id])
  end

  def get_vr
    if params[:vr_id]
      @vr = Vr.find(params[:vr_id])
    else
      @vr = nil
    end
  end
end