class Api::V1::UsersController < Api::V1::BaseController
    def index
        @users = User.all
        render json: @users
    end
    def show
        @user = User.find(params[:id])
        render json: @user
    end
    def login
        token = params[:token]
        userFb = FbGraph::User.me(token)
        userFb = userFb.fetch
        #render json: userFb
        @user = User.where('uid = ?', userFb.identifier).take
        if @user.nil?
            @user = User.my_login(userFb)
        end
        render json: @user
    end

end
