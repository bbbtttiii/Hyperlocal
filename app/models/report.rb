class Report < ActiveRecord::Base
    belongs_to :user
    validates :current_conditions, :presence => true
end