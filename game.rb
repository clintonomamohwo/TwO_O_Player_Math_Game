class Player
  attr_reader :player, :score
  def initialize(player)
    @player = player
    @score = 3
  end

  def decrese
    @score -= 1
  end

  def checker
    @score == 0
  end
end

class Question
  def initialize
    @number1 = rand(1..20)
    @number2 = rand(1..20)
  end

  def check_answer
    answer = @number1 + @number2
    choice = $stdin.gets.chomp
    answer == choice.to_i
  end

  def question_print(current_Player)
    puts "#{current_Player.player}: what does #{@number1} puls #{@number2} equal?"
  end
end

class Loop
  def initialize
    @player1 = Player.new("Player1")
    @player2 = Player.new("Player2")
  end

  def play
    current_Player = @player1
    while !(@player1.checker || @player2.checker)
      question = Question.new
      question.question_print(current_Player)
      if (question.check_answer)
        p "#{current_Player.player}: YES! Your are correct"
      else
        p "#{current_Player.player}: Seriously? NO!"
        current_Player.decrese
      end

      #display score board and change the current player
      if (current_Player == @player1)
        p "P1: #{@player1.score}/3 vs P2: #{@player2.score}/3"
        current_Player = @player2
      else
        p "P1: #{@player1.score}/3 vs P2: #{@player2.score}/3"
        current_Player = @player1
      end

      #display the new or over sign
      if (@player1.checker || @player2.checker)
        p "#{current_Player.player} wins with a score #{current_Player.score}"
        p "------Game over------"
      else
        p "---------New Turn-------"
      end
    end
  end
end

game = Loop.new
game.play