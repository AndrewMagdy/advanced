class DirectMessage < ActiveRecord::Base
    belongs_to :sender , class_name: "User" 
    belongs_to :receiver, class_name: "User"
    validates :sender, :receiver, :body , presence: true
end
