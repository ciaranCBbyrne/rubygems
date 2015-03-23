
class Levelfinder
	#take input of current level, current difficulty of question, questions answered, amount of correct answers
	def self.getLevel(curr_level,curr_diff,ques_count,corr_count)

		#makes sure user has answered enough questions to be graded properly
		if ques_count >= 5
			# work out 80% of answered questions as target to reach
			target = ques_count.to_f * 80 / 100
			
			#if target of correct answers has been reached continue
			if corr_count >= target
				#raise difficulty of question if not already at highest level
				if curr_diff < 2
					curr_diff += 1
				else
					#raise users level if at highest diffulty on previous level and set difficulty to lowest
					curr_diff = 0						
					curr_level += 1
				end
			end
		end

		#return user level and question diffulty
		return curr_level, curr_diff
	# end getLevel
	end
# end Levelfinder
end

