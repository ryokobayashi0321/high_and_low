require_relative "card"
require_relative "deck"
require_relative "master"
require_relative "player"
require_relative "message"
class HighAndLow
  attr_reader :bet, :remaining_money, :paid, :first_card, :second_card

  HIGH_NUMBER = 1
  LOW_NUMBER = 2
  MAGNIFICATION_OF_MONEY = 2
  SELECT_NEW_GAME = 1
  SELECT_STOP_GAME = 2
  NO_MONEY = 0
  MINIMUM_AMOUNT_OF_MONEY = 1

  include Message

  def initialize(master, player)
    @master = master
    @player = player
  end

  def start

    start_message

    loop do
      @deck = Deck.new

      # <所持金の表示>
      give_bet_message(@player)

      # <賭け金を提示する>
      disp_bet(@player)

      drow_card_message

      two_cards

      disp_card_message

      # <highかlowの選択>
      select_ation

      open_card_message

      number_message

      # <判定の条件分岐>
      judge

      calculate

      next_action
    end
  end

  private

  # <賭け金を提示する>
  def disp_bet(player)
    loop do
      @bet = gets.to_i
      # ¥1〜プレイヤーの所持金のみ入力できる
      if @bet.between?(MINIMUM_AMOUNT_OF_MONEY, player.money)
        @remaining_money = player.bet_money(@bet)
        disp_bet_message
        break
      else
        error_bet_message
      end
    end
  end

  def two_cards
    cards = @master.draw_card(@deck)
      @first_card = cards[0]
      @second_card = cards[1]
  end

  # <最初のカードの数字>
  def first_card_point
    @f_point = []
    @f_point << @first_card.instance_variable_get(:@point)
    @fist_point = @f_point.find { |i| i.integer? }
  end

  # # <次のカードの数字>
  def second_card_point
    @s_point = []
    @s_point << @second_card.instance_variable_get(:@point)
    @second_point = @s_point.find { |i| i.integer? }
  end

  # <highかlowの選択>
  def select_ation
    loop do
      high_low_message
      @select_num = gets.to_i

      case @select_num
      when HIGH_NUMBER
        high_message
        break
      when LOW_NUMBER
        low_message
        break
      else
        error_ation_message
      end
    end
  end

  # <判定の条件分岐>
  def judge
    loop do
      case @select_num
      when HIGH_NUMBER
        judge_high
        break
      when LOW_NUMBER
        judge_low
        break
      end
    end
  end

  # <highを選択した場合>
  def judge_high
    if @win =@select_num == HIGH_NUMBER && second_card_point > first_card_point
      win_high_message
    elsif @lose = @select_num == HIGH_NUMBER && first_card_point > second_card_point
      lose_low_message
    elsif @draw = @select_num == HIGH_NUMBER && first_card_point == second_card_point
      draw_game_message
    end
  end

  # <lowを選択した場合>
  def judge_low
    if @lose = @select_num == LOW_NUMBER && second_card_point > first_card_point
      lose_high_message
    elsif @win = @select_num == LOW_NUMBER && first_card_point > second_card_point
      win_low_message
    elsif @draw = @select_num == LOW_NUMBER && first_card_point == second_card_point
      draw_game_message
    end
  end

  def calculate
    if @win
      calculate_win_game
    elsif @draw
      calculate_draw_game
    else
      @lose
    end
      if @player.money <= NO_MONEY
        game_over_message
        exit
      end
  end

  def calculate_win_game
    @paid = @bet * MAGNIFICATION_OF_MONEY
    @remaining_money = @player.paid_money(@paid.floor)
    take_paid_message
  end

  def calculate_draw_game
    @remaining_money = @player.paid_money(@bet)
  end

  # <次の行動>
  def next_action
    loop do
      next_action_message
      new_game_num = gets.to_i

      # <所持金¥0の条件分岐>
      if new_game_num == SELECT_NEW_GAME
        continue_game_message
        @new_game_num = new_game_num
        break
      elsif new_game_num == SELECT_STOP_GAME
        stop_game_message
        exit
      else
        error_ation_message
      end
    end
  end
end
