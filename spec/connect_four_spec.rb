require "connect_four"

describe Game do
	
	let(:rows) {6}
	let(:columns) {7}

	let(:game) { Game.new("Aaron", "Tammy", rows, columns)}

	let(:p1) { game.player_1 }
	let(:p2) { game.player_2 }

	describe ".initialize" do
		it "should have 6 rows and 7 columns" do
			expect(game.board.state.length).to eq(6)
			expect(game.board.state[0].length).to eq(7)
		end

		it "should have an active player" do
			expect(game.active_player.name).to eq("Aaron")
			expect(game.active_player.color).to eq(p1.color)
		end
	end

	describe ".make_move" do

		before do
			game.make_move(4)
			# game.switch_active_player # No need to use this here, you built it into make_move
			game.make_move(5)
		end

		it "should move pieces to the lowest unblocked space" do
			expect(game.board.state[-1][3]).to eq("Black")
		end

		it "should switch the active player after each move" do
			expect(game.board.state[-1][4]).to eq(" Red ")
			expect(game.active_player).to eq(p1)
		end
	end
end