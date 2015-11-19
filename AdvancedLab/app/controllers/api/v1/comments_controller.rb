class Api::V1::PostsController < Api::V1::BaseController
    respond_to :json
    def index
        @comments = Comment.all
        render json: @comments
    end

    def create
        @comment = Comment.create(body: params[:body],
            post_id: params[:post_id], user_id: params[:user_id])
        respond_with :api, :v1, @comment
    end

end
