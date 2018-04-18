class Game
	Player = Struct.new(:name, :color)
	Board = Struct.new(:state, :rows, :columns, :empty_space) do
		def to_s
			"#{state}"
		end

		def show
			for label in (0...self.columns)
				print "  #{label}  "
			end
			for row in (0...self.rows)
				puts "\n"
				for column in (0...self.columns)
					print "#{self.state[row][column]}"
				end
			end
		end

		def add_move(color, column)
			row = self.rows - 1 # start checking for spaces at "bottom" row
			# self.show
			until self.state[row][column] == self.empty_space
				row -= 1
			end
			self.state[row][column] = color
		end
	end

	attr_accessor :player_1, :player_2, :active_player, :winner
	attr_reader :board

	def initialize(player_1_name, player_2_name, rows, columns)
		@player_1 = Player.new(player_1_name, "Black")
		@player_2 = Player.new(player_2_name, " Red ")
		@board = Board.new([], rows, columns, " [_] ")
		for row in (0...@board.rows)
			@board.state << []
			for column in (0...@board.columns)
				@board.state[row] << @board.empty_space
			end
		end

		@active_player = @player_1
		@winner = nil
	end

	def make_move(column)
		@board.add_move(@active_player.color, column - 1) # Correct column ID for indexing
		switch_active_player
	end

	def switch_active_player
		if @active_player == @player_1
			@active_player = @player_2
		else
			@active_player = @player_1
		end
	end

end

# Going to leave this assignment without building in a victory condition,
# since doing so for Connect Four would be a bit more tedious than with Tic-Tac-Toe.
# It might still be nice practice, but I assume I'll get that from future lessons, too.
# (In general, the structure of how the game operated would be very similar to that of Tic-Tac-Toe.)