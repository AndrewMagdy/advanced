class Api::V1::PostsController < Api::V1::BaseController
    respond_to :json, location_helper_prefix: :post_product
    def index
        @posts = Post.all
        render json: @posts
    end
    def show
        @post = Post.find(params[:id])
        render json: @post
    end

    def create
        @post = Post.create(title: params[:title], body: params[:body],
            recepient_id: params[:recepient_id], user_id: params[:user_id])
        respond_with :api, :v1, @post
    end

end
