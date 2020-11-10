require './QuestionGenerator'
require './Player'

class Game  
  attr_reader :players, :messages
  
  def initialize(question_range, players, messages)
    @players = players.map { |p| Player.new(p[:name], p[:orig_lives]) }
    @messages = messages

    @q_gen = QuestionGenerator.new(question_range)

  end

  def ask_question(player)
    q, sol = @q_gen.gen_question.values_at :q, :sol

    puts "#{player.name}: What does #{q} equal?"
    answer = gets.chomp.to_i

    if answer == sol
      puts @messages[:correct]
    else 
      player.lose_life
      puts @messages[:wrong]
    end
  end

  def print_status
    status_record = @players.map do |p|
      "#{p.name}: #{p.lives}/#{p.orig_lives}"
    end

    puts status_record.join(' vs ')
  end

  #  recursively returns next player with lives left
  def next_alive_player(players_turn_tracker)

    current_player = players_turn_tracker.next

    if current_player.lives == 0
      next_alive_player(players_turn_tracker)

    else
      current_player
    end
    
  end


  def get_winner(players)
    players_still_alive = players.select { |p|  p.lives > 0 }

    if (players_still_alive.size == 1)
      players_still_alive[0]
    else
      nil
    end
  end

  def run_game
    players_turn_tracker = players.cycle
   
    winner = false
    while !winner
      current_player = next_alive_player(players_turn_tracker)

      ask_question(current_player)
      
      print_status
      
      turn_message = '------ NEXT TURN -------'

      if current_player.lives == 0 
        puts "Sorry #{current_player.name}! You're out!"
        
        winner = get_winner(players)
        if winner
          puts "Congrats #{winner.name}, you win with a score of #{winner.lives}/#{winner.orig_lives}"
          turn_message = '------ GAME OVER -------'
          winner = true
        end
        
      end 

      puts ''
      puts turn_message

    end
  end

end

