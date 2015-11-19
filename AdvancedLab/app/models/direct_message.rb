class DirectMessage < ActiveRecord::Base
    belongs_to :sender , class_name: "User" 
    belongs_to :reciever, class_name: "User"
    validates :sender, :reciever, presence: true
end
