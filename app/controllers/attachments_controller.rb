class AttachmentsController < ApplicationController
  before_action :get_notice, only: [:index, :create]
  before_action :get_attachment, only: [:show, :destroy, :update]

  def index
    if @notice
      render json: @notice.attachments
    else
      render json: Attachment.all
    end
  end

  def create
    @attachment = @notice.attachments.create!(attachment_params)
    render json: @attachment
  end

  def show
    render json: @attachment
  end

  def update
    @attachment.update(attachment_params)
    render json: @attachment
  end

  def destroy
    @attachment.destroy
    render json: @attachment
  end

  private

  def attachment_params
    params.require(:attachment).permit(:file_name, :notice_id, :display_name)
  end

  def get_attachment
    @attachment = Attachment.find(params[:id])
  end

  def get_notice
    if params[:notice_id]
      @notice = Notice.find(params[:notice_id])
    else
      @notice = nil
    end
  end
end