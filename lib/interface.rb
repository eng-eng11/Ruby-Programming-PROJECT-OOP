module Interface

  def show(positions)
    puts "\t  #{positions[6]} | #{positions[7]} | #{positions[8]}"
    puts "\t ---|---|---"
    puts "\t  #{positions[3]} | #{positions[4]} | #{positions[5]}"
    puts "\t ---|---|---"
    puts "\t  #{positions[0]} | #{positions[1]} | #{positions[2]}"
    puts ""
  end

  def get_input(text, default="")
    texts ={
        'position' => "Please enter your position (1 - 9) or press 'q' to exit game: \n",
        'play?' => "Would you like to play again?(y/n)?\n" ,
        'taken' => "Try again, that spot has been taken already.\n" ,
        'valid' => "Please enter an valid number, thanks! \n",
        'win' => "Congratulations! You won!\n",
        'full' => "Game board is full!\n",
        'name' => "Please input your name for",
        'welcome' => "Welcome to the Tic-Tac-Toe Game, there will be 2 players to join this game! \n",
        'finish' => "Thanks for your time! \n",
        'quit' => "Sorry to see you go, see you next time! \n"
    }

    print texts[text]

    case text
    when 'position'
      return gets.chomp
    when 'play?'
      input = gets.chomp
      return input == "y"
    when 'name'
      print "(#{default}):"
      return gets.chomp
    when 'finish'
      sleep 1
      exit
    when 'quit'
      exit
    else
      return false
    end

  end

  def valid_number?(input)
    regex = /^[1-9]$/
    regex.match?(input)
  end

  def next_move(player)
    loop do
      print "#{player.name}, "
      input = get_input('position')

      if valid_number?(input)
        input = input.to_i
        if @board.taken?(input)
          get_input('taken')
        else
          player.move(input)
          @board.update(input, player.char)
          show(@board.positions)
          break
        end
      else
        get_input('quit') if input == "q"
        get_input('valid')
      end
      show(@board.positions)
    end
  end

  def winner_display(name, positions)
    print "#{name}, "
    get_input('win')
    show(positions)
  end

  def play_again?
    if get_input('play?')
      @status = "initial"
      return true
    end
  end

end
