defmodule DataParser do
	def parse_data() do
		
    	list = ["JANUARY", "FEBRUARY", "MARCH", "APRIL","MAY","JUNE", "JULY", "AUGUST", "SEPTEMBER", "OCTOBER", "NOVEMBER", "DECEMBER"]
		Enum.random(list) 
	end

end

IO.puts DataParser.parse_data()