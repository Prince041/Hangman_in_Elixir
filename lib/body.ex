defmodule Aman do

  def endgame() do
    IO.puts "LAST WRONG ATTEMPT MADE"
    IO.puts "------------------------GAME OVER---------------------------"
  end

  def print(guess_string) do
    IO.puts ("ENTER NEXT ELEMENT -->>")
    IO.puts "\"#{guess_string}\""
  end

  def replace_func([],guess_string,_a,list_gen,count,input_alphabates) do
    cond do
      Enum.all?(guess_string, fn(x) -> x != "-" end) ->
        IO.inspect to_string(guess_string)
        IO.puts ("---------------------CONGRATULATIONS!!!!! YOU WON---------------------\n")
      true ->
        IO.puts "\"#{guess_string}\""
        IO.puts ("WHAT'S YOUR NEXT GUESS -->>")
        input_element(guess_string,list_gen,count,input_alphabates)
    end            
  end


  def replace_func([h|t],guess_string,a,list_gen,count,input_alphabates) do
    guess_string = List.replace_at(guess_string,h,hd(a))
    replace_func(t,guess_string,a,list_gen,count,input_alphabates)
  end

  def change_element(guess_string,list_gen,count,_input_alphabates,check_alphabate,a) do   
    input_alphabates = check_alphabate
    #Matching list generation
    li = Enum.with_index(list_gen) |> Enum.filter_map(fn {x, _} -> x == hd(a) end, fn {_, i} -> i end)
    
    cond do
      li ==[] and count == 0 ->
        IO.puts "FIRST WRONG ATTEMPT MADE"
        count = count + 1
        IO.puts "                      ______"
        IO.puts "                     |      |"
        IO.puts "                     O      | "
        print(guess_string)
        input_element(guess_string,list_gen,count,input_alphabates)
      li ==[] and count == 1 ->
        IO.puts "SECOND WRONG ATTEMPT MADE"
        count = count + 1
        IO.puts "                      ______"
        IO.puts "                     |      |"
        IO.puts "                     O      | "
        IO.puts "                    /|      |"
        IO.puts  "\n"
        print(guess_string)
        input_element(guess_string,list_gen,count,input_alphabates)
      li ==[] and count == 2 ->
        IO.puts "THIRD WRONG ATTEMPT MADE"
        count = count + 1
        IO.puts "                      ______"
        IO.puts "                     |      |"
        IO.puts "                     O      | "
        IO.puts "                    /|\\     |"
        IO.puts "\n"
        print(guess_string)
        input_element(guess_string,list_gen,count,input_alphabates)
      li ==[] and count == 3 ->
        IO.puts "FOURTH WRONG ATTEMPT MADE"
        count = count + 1
        IO.puts "                      ______"
        IO.puts "                     |      |"
        IO.puts "                     O      | "
        IO.puts "                    /|\\     |"
        IO.puts "                     |      | "
        IO.puts "\n"
        print(guess_string)
        input_element(guess_string,list_gen,count,input_alphabates)
      li ==[] and count == 4 ->
        IO.puts "FIFTH WRONG ATTEMPT MADE"
        count = count + 1
        IO.puts "                      ______"
        IO.puts "                     |      |"
        IO.puts "                     O      | "
        IO.puts "                    /|\\     |"
        IO.puts "                     |      | "
        IO.puts "                    /|      |"
        IO.puts "\n"
        print(guess_string)
        input_element(guess_string,list_gen,count,input_alphabates)
      li ==[] and count == 5 ->
        IO.puts "                      ______"
        IO.puts "                     |      |"
        IO.puts "                     O      | "
        IO.puts "                    /|\\     |"
        IO.puts "                     |      | "
        IO.puts "                    /|\\     |"
        IO.puts "\n"
        endgame()

        #input_element(guess_string,list_gen,count)
      true ->
        replace_func(li,guess_string,a,list_gen,count,input_alphabates)
        
    end
  end

  def input_element(guess_string,list_gen,count,input_alphabates) do
                
    a = String.trim(IO.gets "")
    a = String.upcase(a)
    a = String.graphemes(a)
    
    check_alphabate = input_alphabates -- a
    
    cond do
      check_alphabate != input_alphabates ->
        change_element(guess_string,list_gen,count,input_alphabates,check_alphabate,a)
      true                                 ->
        IO.puts "This character already used :) "
        input_element(guess_string,list_gen,count,input_alphabates)
     end 
  end

  def first_time(string_gen) do                
    input_alphabates = ["Q","W","E","R","T","Y","U","I","O","P","A","S","D","F","G","J","H","K","L","Z","X","C","V","B","N","M"] 
    #list = ["JANUARY", "FEBRUARY", "MARCH", "APRIL","MAY","JUNE", "JULY", "AUGUST", "SEPTEMBER", "OCTOBER", "NOVEMBER", "DECEMBER"]
    count = 0
    #string_gen = Enum.random(list)
    length_of_string_gen = String.length(string_gen)
    guess_string=String.duplicate("-", length_of_string_gen)
    guess_string=String.graphemes(guess_string)
    list_gen = String.graphemes(string_gen)
    IO.puts "\"#{guess_string}\""
    IO.puts("ENTER THE FIRST ELEMENT YOU WANT TO ADD -->>")
    input_element(guess_string,list_gen,count,input_alphabates)
  end
end
#IO.inspect Aman.random()