class User < ApplicationRecord
	has_many :players

	def has_full_goalkeepers
		players.where(role: "P").count >= 3
	end

	def has_full_defenders
		players.where(role: "D").count >= 8
	end

	def has_full_midfielders
		players.where(role: "C").count >= 8
	end

	def has_full_strikers
		players.where(role: "A").count >= 6
	end

end
