class Comment < ActiveRecord::Base
    belongs_to :user 
    belongs_to :post
    validates :user, :post, :body, presence: true
end
