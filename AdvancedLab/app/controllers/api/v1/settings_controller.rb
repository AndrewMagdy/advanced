class Api::V1::SettingsController < Api::V1::BaseController
    respond_to :json
    def show
        @setting = Setting.where(user_id: params[:user_id])
        render json: @setting
    end

    def updateOrCreate
        @setting = Setting.where(user_id: params[:user_id])
        @setting  = (@setting.empty?)?Setting.create(user_id: params[:user_id],
            profile_color: params[:profile_color],
            privacy_level: params[:privacy_level]):@setting
        render json: @setting
    end


end
