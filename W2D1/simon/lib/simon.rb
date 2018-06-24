class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    puts "Welcome to the game Simon. This game will test the limits of your memory!"
    until game_over
      take_turn
    end
    game_over_message
    reset_game
  end

  def take_turn
    show_sequence
    require_sequence
    if @user_input == @seq
      @sequence_length += 1
      round_success_message
    else
      @game_over = true
    end
  end

  def show_sequence
    add_random_color
    puts "Watch closely and memorize the sequence:"
    @seq.each { |color| print "#{color} " }
    puts
  end

  def require_sequence
    puts "Ready to go? (y/n)"
    status = gets.chomp
    if status == "y"
      system "clear"
      puts "Repeat the sequence by typing the order of colors (eg. blue,red,green,yellow)"
      print "> "
      input = gets.chomp.split(",")
      @user_input = input
    else
      puts "Please type y for yes once you are ready."
      require_sequence
    end
  end

  def add_random_color
    new_color = COLORS.sample
    seq.push(new_color)
  end

  def round_success_message
    puts "Good job! Here comes round number: #{@sequence_length}"
  end

  def game_over_message
    puts "GAME OVER. The correct sequence was "
    @seq.each { |color| print "#{color} " }
    puts
    puts "You completed #{@sequence_length} rounds!"
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
  end
end

if __FILE__ == $PROGRAM_NAME
  ng = Simon.new
  ng.play
end
