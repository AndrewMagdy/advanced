class User < ActiveRecord::Base
     has_and_belongs_to_many :projects
     has_many :project_messages
     has_one :setting

     has_many :friendships


     scope :friend_accepted, -> {where(friendships: {accepted: true}).order('first_name DESC') }
     scope :request_pending, -> {where(friendships: {accepted: false}).order('first_name DESC') }


     has_many :friends, -> {friend_accepted}, :through => :friendships,:source => :friend
     has_many :friend_requests, -> {request_pending }, :through => :friendships ,:source => :friend

     has_many :messages_sent,      :class_name => 'DirectMessage', :foreign_key => 'sender_id'
     has_many :messages_received,  :class_name => 'DirectMessage', :foreign_key => 'receiver_id'

     has_many :posts_own_timeline, :class_name => 'Post', :foreign_key => 'recepient_id'
     has_many :posts_other_timeline, :class_name => 'Post', :foreign_key => 'user_id'

     validates :name, presence: true
     def self.from_omniauth(auth)
        where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |user|
            user.provider = auth.provider
            user.uid = auth.uid
            user.name = auth.info.name
            user.first_name = auth.info.first_name
            user.last_name = auth.info.last_name
            user.email = auth.info.email
            user.password = Devise.friendly_token[0,20]
            user.oauth_token = auth.credentials.token
            user.oauth_expires_at = Time.at(auth.credentials.expires_at)
            user.save!
        end
    end
    def self.my_login(userFbGraph)
        where(uid: userFbGraph.identifier).first_or_initialize.tap do |user|
            user.uid = userFbGraph.identifier
            user.name = userFbGraph.name
            user.first_name = userFbGraph.first_name
            user.last_name = userFbGraph.last_name
            user.email = userFbGraph.email
            user.password = Devise.friendly_token[0,20]
            user.oauth_token = userFbGraph.access_token
            #user.oauth_expires_at = Time.at(userFbGraph.expires_at)
            user.save!
        end
    end

end
