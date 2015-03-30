
class Credit
	# gem that generates a rating for the user depending on what level they're at
	def self.setCredit(level)

		@genius = ""

		#if they are only starting they are a Rookie
		if level <= 3
			@genius = "Rookie"

		#if they are intermediate they are a Goose
		elsif level > 3 and level < 7
			@genius = "Goose"

		# if they are good they are a TopGun
		elsif level >= 7
			@genius = "TopGun"
		end

		return @genius
	end
end
				