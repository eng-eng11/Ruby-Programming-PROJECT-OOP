module Interface

  def show(positions)
    puts "\t  #{positions[6]} | #{positions[7]} | #{positions[8]}"
    puts "\t ---|---|---"
    puts "\t  #{positions[3]} | #{positions[4]} | #{positions[5]}"
    puts "\t ---|---|---"
    puts "\t  #{positions[0]} | #{positions[1]} | #{positions[2]}"
    puts ""

  end

  def show_text(text)
    texts ={
        'position' => "Please enter your position (1 - 9) or press 'q' to exit game: \n",
        'play?' => "Would you like to play again?(y/n)?\n" ,
        'taken' => "Try again, that spot has been taken already.\n" ,
        'invalid' => "Please enter an valid number, thanks! \n",
        'win' => ", congrate! You won!\n",
        'full' => "Game board is full!\n",
        'player1' => "Please input your name for #{text}: \n",
        'player2' => "Please input your name for #{text}: \n",
        'welcome' => "Welcome to the Tic-Tac-Toe Game, there will be 2 players to join this game! \n",
        'finish' => "Thanks for your time! \n",
        'quit' => "Sorry to see you go, see you next time! \n"
    }
    print texts[text]
    return text
  end

  def get_input(text)
    show_text(text)
    return gets.chomp
  end

  def valid_number?(input)
    regex = /^[1-9]$/
    regex.match?(input)
  end

  def get_next_move(name)
    print "#{name}, "
    show_text('position')
    input = gets.chomp

    return show_text('quit') if input == "q"
    return show_text('invalid') if !valid_number?(input)
    return input
  end

  def update_input(input, player, board)
    input = input.to_i
    if board.taken?(input)
      show_text('taken')
      return false
    else
      player.move(input)
      board.update(input, player.char)
      return true
    end
  end

end
