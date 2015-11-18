class User < ActiveRecord::Base
     has_and_belongs_to_many :projects
     has_many :friendships
     has_many :friends, through: :friendships
     
end
