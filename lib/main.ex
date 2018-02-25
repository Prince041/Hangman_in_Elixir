defmodule MainS do
	use GenServer
	alias DataParser

	def start_link do
		GenServer.start_link(__MODULE__, "", name: :hangman_game_store)
	end

	def init(_) do
		{:ok, DataParser.parse_data()}
	end
	def random() do
		GenServer.call(:hangman_game_store,{:random}, 500000 )
	end

	def handle_call({:random}, _from, random_word) do
		answer = Aman.first_time(random_word)
		{:reply, answer, random_word}
	end
end