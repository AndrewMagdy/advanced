class Project < ActiveRecord::Base
    has_and_belongs_to_many :users
    has_many :project_messages
    
    validates :project_name, :project_description,:project_type, presence: true
end
