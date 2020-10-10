class AuctionsController < ApplicationController

	def index
		@users = User.all
		@fetching = "Portieri"
		role = "P"
		if @users.all? &:has_full_goalkeepers
			@fetching = "Difensori"
			role = "D"
			if @users.all? &:has_full_defenders
				@fetching = "Centrocampisti"
				role = "C"
				if @users.all? &:has_full_midfielders
					@fetching = "Attaccanti"
					role = "A"
					if @users.all? &:has_full_strikers
						@fetching = "Finito"
					end
				end
			end
		end
		if params[:rand]
			min_sampled = Player.minimum(:sampled)
			available_players = Player.where(user_id: nil, role: role, sampled: min_sampled)
			idx = rand(available_players.count)
			@player = available_players[idx]
			@player.update(sampled: min_sampled + 1)
		end
	end

	def assign
		user = User.find(params[:user_id])
		newcredits = user.credits - params[:cost].to_i
		if newcredits >= 0
			user.update(credits: newcredits)
			Player.find(params[:player_id]).update(user_id: params[:user_id], cost: params[:cost])
		end
		redirect_to auctions_path(rand: true)
	end

end
