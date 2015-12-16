class Api::V1::CommentsController < Api::V1::BaseController
    respond_to :json
    def index
        @comments = Comment.all
        render json: @comments
    end
    def show
        @comment = Comment.find(params[:id])
        render json: @comment
    end

    def create
        @comment = Comment.create(body: params[:body],
            post_id: params[:post_id], user_id: params[:user_id])
        respond_with :api, :v1, @comment
    end

    def showComments
        @comments = Comment.where(params[:post_id])
        render json: @comments
    end

end
