
class Generate
	# set variables that will be returned from the gem
	@answer = 0
	@question = ""
	@level = 0
	@difficulty = 0

	# generate random questions
	def self.makeQuestion(level, difficulty)
		# change gem variables to variables passed into gem
		@level = level
		@difficulty = difficulty

		# control to see if there are no more levels then random questions will be picked from below,
		# and will gradually grow harder
		if level > 10
			level = rand(11)
		end

		upper = 0
		lower = 0
		# set the limits of random number depending on difficulty, lowest level is from 0 to 9
		if difficulty == 0
			upper = 10
		
		# this will pick a number from 10 and 29
		elsif difficulty == 1
			lower = 10
			upper = 20

		# this will pick a number between 30 and 100 (30 + 70)
		else
			lower = 30
			upper = 70
		end
			
		# generate random numbers
		a = (rand(upper) + lower).to_i
		b = rand(a).to_i
		c = rand(a+b).to_i

		# simple addition
		if level < 1

			@question = "#{a} + #{b}"
			@answer = a + b

		# addition with 3 numbers
		elsif level == 1

			@question = "#{a} + #{b} +#{c}"
			@answer = a + b + c

		# simple subtraction
		elsif level == 2

			@question = "#{a} - #{b}"
			@answer = a - b
			
		# addition and subtraction combined
		elsif level == 3

			@question = "#{a} + #{b} - #{c}"
			@answer = a + b - c

		# subtraction leaving negative number
		elsif level == 4

			@question = "#{b} - #{a}"
			@answer = b - a

		# addition and subtraction leaving negative number
		elsif level == 5

			# make c a larger number than a and b combined
			c = c + a + b

			@question = "#{a} + #{b} - #{c}"
			@answer = a + b - c

		# simple multiplication
		elsif level == 6

			@question = "#{a} x #{b}"
			@answer = a * b

		# simple division
		elsif level == 7

			# add 1 in case it is zero
			a = a + 1
			# if b is zero make it 2
			if b == 0
				b = 2
			end

			# make sure b can divide into a to make it simple
			while a % b != 0 && b != 0
				b = rand(a) + 1
			end

			@question = "#{a} ÷ #{b}"
			@answer = a / b

		# mixing multiplication and division
		elsif level == 8
			
			# add 1 in case it is zero
			a = a + 1
			b = b + 1

			# if c is zero make it 2
			if c == 0
				c = 2
			end

			# make sure c can divide into a + b to make it simple
			while (a*b) % c != 0 && c != 0
				c = rand(a*b) + 1
			end

			@question = "#{a} x #{b} ÷ #{c}"
			@answer = a * b / c

		# first type of precedence question with addition and multiplication
		elsif level == 9

			@question = "(#{a} + #{b}) x #{c}"
			@answer = (a + b) * c

		# second type of precedence question with addition and multiplication
		elsif level == 10

			@question = "#{c} x #{b} + #{a}"
			@answer = c * b + a				
		
		#end if statements	
		end

		# return the question generated. This will also be saved until makeQuestion called again
		return @question
	# end makeQuestion
	end
	
	# return question, answer, level and difficulty variables
	def self.getQuestion

		return @question, @answer, @level, @difficulty
	end

	# check if answer to question passed in is the same as the answer generated for the question
	def self.answerCheck(check)
		# control if there is no input
		if check != nil
			# if true return correct, if false return incorrect
			if check == @answer
				return "correct"
			else
				return "incorrect"
			# end if
			end
		# end if
		end
	# end answerCheck
	end
# end Generate
end

