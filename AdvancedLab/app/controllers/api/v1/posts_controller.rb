class Api::V1::PostsController < Api::V1::BaseController
    respond_to :json
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

    def myposts
        @posts = Post.where("user_id = ?", params[:user_id])
        respond_with :api, :v1, @posts
    end

    def timeline
        @postsFriends = Post.joins("LEFT OUTER JOIN friendships ON friendships.accepted = 1")
            .where("friendships.user_id = ? AND (posts.user_id = friendships.friend_id OR posts.user_id = ?)", params[:user_id], params[:user_id]).select("posts.id,posts.title,posts.body,posts.user_id, posts.created_at, posts.updated_at, posts.recepient_id")
        @postsMe = Post.where("user_id = ?", params[:user_id])
        #where("user_id = ? OR recepient_id = ?", params[:user_id], params[:user_id])
        render json: @postsMe + @postsFriends
    end


end
