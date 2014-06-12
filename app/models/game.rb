class Game < ActiveRecord::Base
	belongs_to :user
	has_many   :cards
	
	validates :user_id, presence: true
end
