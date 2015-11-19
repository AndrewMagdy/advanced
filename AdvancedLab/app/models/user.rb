class User < ActiveRecord::Base
     has_and_belongs_to_many :projects
     has_many :friendships
     has_many :friends, through: :friendships
     has_many :messages_received,  :class_name => 'DirectMessage', :foreign_key=> 'reciever_id'
     has_many :messages_sent,      :class_name => 'DirectMessage', :foreign_key=> 'sender_id'
end
