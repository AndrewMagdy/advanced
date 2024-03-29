class Api::V1::FriendshipsController < Api::V1::BaseController
    respond_to :json
    def index
        @friendships = Friendship.all
        render json: @friendships
    end

    def show
        @friendship = Friendship.find(params[:id])
        render json: @friendship
    end

    def create
        @friendship = Friendship.create(friend_id: params[:friend_id],
            user_id: params[:user_id], accepted: 1)
        respond_with :api, :v1, @friendship
    end

    def newFriend
        @friendship = Friendship.create(friend_id: params[:friend_id],
                user_id: params[:user_id], accepted: 1)
            respond_with :api, :v1, @friendship
    end

    def unfriend
        @friendship = Friendship.where("user_id = ? AND friend_id = ?", params[:user_id], params[:friend_id]).first
        Friendship.destroy(@friendship.id)
        render json: { :status => "ok", :message => "Success!"}
    end
    def myrequests
        @requests = Friendship.where("user_id = ? AND accepted = 0", params[:user_id])
        respond_with :api, :v1, @requests
    end

    def myfriends
        @friends = Friendship.where("user_id = ?", params[:user_id])
        render json: @friends
    end

    def isfriends
        @friend1 = Friendship.where("user_id = ? AND friend_id = ? AND accepted = 1",
            params[:user_id], params[:friend_id]).take
        @friend2 = Friendship.where("user_id = ? AND friend_id = ? AND accepted = 1",
            params[:friend_id], params[:user_id]).take
        isf = (@friend1.nil? && @friend2.nil?) ? 0 : 1
        render json: {friends:  isf}
    end

    def accept
        @friendship = Friendship.find(params[:id])
        @friendship.accepted = params[:accepted]
        @friendship.save
        render json: @friendship
    end

end
