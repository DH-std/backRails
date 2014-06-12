class Card < ActiveRecord::Base
	belongs_to :game 
	belongs_to :hand

	validates :game_id, presence: true
	validates :suit, inclusion: { in: %w(h s c d), 
		message: "%{value} is not a valid suit" }
	validates :rank, inclusion: { in: %w(2 3 4 5 6 7 8 9 10 J Q K A), 
		message: "%{value} is not a valid rank" }
	validates :value, inclusion: { in: [1,2,3,4,5,6,7,8,9,10], 
		message: "%{value} is not a valid value" }
end
