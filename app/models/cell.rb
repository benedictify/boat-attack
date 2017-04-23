class Cell
	attr_accessor :hit_status
	attr_accessor :boat

	def initialize(x, y)
		# hit status will be '0' for not-yet-attacked, 
		# 'X' for hit and '/' for missed
		@hit_status = 'open'
		# boat variable will hold the boat object that is in that spot
		# boat objects will hold an array of cell objects it sits on
		@boat = 'empty'

		@x = x
		@y = y
	end
end