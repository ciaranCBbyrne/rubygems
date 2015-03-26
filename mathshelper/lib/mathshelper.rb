# gem that returns tips on how to solve simple maths questions
# pass the question into the gem and it will return 3 lines of tips

class Helper
	def self.giveHelp(question)
		
		# Strings for ouput corresponding with tips to be given
		multiply = "Multiply the numbers either side of the 'x' symbol."
		divide = "Divide the number on the right of the '÷' symbol into the number on the left."
		brackets = "If there are brackets solve inside brackets first."
		addition = "Add numbers either side of the '+' symbol." +
				" If there's 2 or more '+' symbols work with only the numbers at either side of the first one to begin with."
		subtraction = "Take the number on the right of the '-' symbol away from the number on the left."
		negative = "If the number on the right of the '-' is larger than the left the result will be a negative number." +
				" If there's 2 or more '-' symbols work with only the numbers to either side of the first one to begin with."

		# combine multiplication and division
		if question.include? "x" and question.include? "÷"
			@first_line = "Step 1: " + multiply
			@second_line = "Step 2: " + divide
			@third_line = nil
		
		# combine multiplication and addition
		elsif question.include? "x" and question.include? "+"
			@first_line = "Step 1: " + brackets
			@second_line = "Step 2: " + multiply
			@third_line = "Step 3: " + addition
		
		# division
		elsif question.include? "÷"
			@first_line = "Step 1: " + divide
			@second_line = nil
			@third_line = nil
		
		# multiplication
		elsif question.include? "x"
			@first_line = "Step 1: " + multiply
			@second_line = nil
			@third_line = nil
		
		# combine addition and subtraction
		elsif question.include? "+" and question.include? "-"
			@first_line = "Step 1: " + addition
			@second_line = "Step 2: " + subtraction
			@third_line = "Note: " + negative
		
		# subtraction
		elsif question.include? "-"
			@first_line = "Step 1: " + subtraction
			@second_line = "Note: " + negative
			@third_line = nil
		
		# addition
		elsif question.include? "+"
			@first_line = "Step 1: "	+ addition
			@second_line = nil
			@third_line = nil
		end

		# return all lines of tips
		return @first_line, @second_line, @third_line
	end
end
