require_relative 'board'
require_relative 'boat'
require_relative '../helpers/boat_helpers'

class Player
	attr_accessor :shots_fired
	attr_reader :board
	attr_reader :type, :fleet, :name, :volley_size

	def initialize(options = {})
		lengths = options[:lengths]
		lengths ||= bednar_fleet_lengths

		@board = new_board
		@name = options[:name]
		@name ||= "Player"
		@type = options[:type] # :human or :computer
		@name = "Computer" if @type == :computer
		
		@fleet = generate_fleet(lengths)
		@volley_size = options[:volley_size]
		@volley_size ||= @fleet.length

		@shots_fired = 0
	end

	def new_board
		Board.new(player: self)
	end

	def boats_remaining
		boats = @fleet.find_all { |boat| boat.afloat? }

		boats.length
	end

	def boat_sunk
		@volley_size -= 1
	end

	def defeated?
		boats_remaining <= 0
	end

	private

	def generate_fleet(lengths)
		fleet = []

		lengths.each do |boat_length|
			fleet << new_boat(boat_length)
		end

		fleet
	end

	def new_boat(length)
		Boat.new(length: length, player: self)
	end
end
