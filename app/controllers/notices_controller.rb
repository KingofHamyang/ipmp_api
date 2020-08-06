class NoticesController < ApplicationController

  def index
    @notices = Notice.all
    render json: @notices
  end

  def show
    render json: Notice.find(params[:id])
  end

  def create
    @notice = Notice.create(notice_params)
    render json: @notice
  end

  def update
    @notice = Notice.find(params[:id])
    @notice.update(notice_params)
    render json: @notice
  end

  def destroy
    @notice = Notice.find(params[:id])
    @notice.destroy
    render json: @notice
  end

  private

  def notice_params
    params.require(:notice).permit(:title, :description)
  end
end
