class Post < ActiveRecord::Base
    belongs_to :user, class_name: "User"
    belongs_to :recepient, class_name: "User"
    has_many :comments
    validates :user, :recepient, :body, :title, presence: true 
end
