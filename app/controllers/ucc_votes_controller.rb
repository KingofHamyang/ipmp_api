class UccVotesController < ApplicationController
  before_action :get_ucc, only: [:index, :create]
  before_action :get_user, only: [:index, :create]
  before_action :get_ucc_vote, only: [:show, :destroy, :update]

  def index
    if @ucc
      render json: @ucc.ucc_votes
    elsif @user
      render json: @user.ucc_votes
    else
      render json: UccVote.all
    end
  end

  def show
    render json: @ucc_vote
  end

  private

  def get_user
    if params[:user_id]
      @user = User.find(params[:user_id])
    else
      @user = nil
    end
  end

  def get_ucc_vote
    @ucc_vote = UccVote.find(params[:id])
  end

  def get_ucc
    if params[:ucc_id]
      @ucc = Ucc.find(params[:ucc_id])
    else
      @ucc = nil
    end
  end
end