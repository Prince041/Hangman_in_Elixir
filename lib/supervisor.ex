defmodule Super do
	use Supervisor
	alias Main

	def start_link do
		Supervisor.start_link(__MODULE__, [])
	end

	def init(_) do
		children = [
			worker(MainS, []),
		]

		supervise(children, strategy: :one_for_one)
	end
end