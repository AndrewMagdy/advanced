class Setting < ActiveRecord::Base
    belongs_to :user
    
    validates :user, :privacy_level, :profile_color, presence: true
end
