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
     
     validates :first_name, :last_name, :user_name, :password, presence: true 
end
