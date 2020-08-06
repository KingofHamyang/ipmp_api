class SettingsController < ApplicationController

  def index
    @settings = Setting.all
    render json: @settings
  end

  def show
    render json: Setting.find(params[:id])
  end

  def create
    @setting = Setting.create(setting_params)
    render json: @setting
  end

  def update
    @setting = Setting.find(params[:id])
    @setting.update(setting_params)
    render json: @setting
  end

  def destroy
    @setting = Setting.find(params[:id])
    @setting.destroy
    render json: @setting
  end

  private

  def setting_params
    params.require(:setting).permit(:key, :value)
  end
end
