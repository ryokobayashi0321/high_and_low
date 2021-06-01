require_relative "card"
require_relative "deck"
require_relative "master"
require_relative "player"
require_relative "message"
class HighAndLow
  attr_reader :bet, :remaining_money, :paid

  HIGH_NUMBER = 1
  LOW_NUMBER = 2
  MAGNIFICATION_OF_MONEY = 2
  SELECT_NEW_GAME = 1
  SELECT_STOP_GAME = 2
  NO_MONEY = 0
  MINIMUM_AMOUNT_OF_MONEY = 1

  include Message

  def initialize(master, player, deck)
    @master = master
    @player = player
    @deck = deck
  end

  def start
    start_message

    # ステージ(カードの置き場)をリセット
    @master.reset_stages

    # <所持金の表示>
    give_bet_message(@player)

    # <賭け金を提示する>
    disp_bet(@player)

    drow_card_message

    @master.draw_first_card(@deck)

    disp_first_card_message(@master)

    @master.draw_second_card(@deck)

    # <highかlowの選択>
    select

    open_card_message

    first_number_message(@master)

    second_number_message(@master)

    # <判定の条件分岐>
    judge
  end

  private

  # <highかlowの選択>
  def select
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
      next_action
    end
  end

  # <highを選択した場合>
  def judge_high
    if @select_num == HIGH_NUMBER && @master.second_card_point > @master.first_card_point
      win_high_message
      calculate_win_high
      take_paid_message
    elsif @select_num == HIGH_NUMBER && @master.first_card_point > @master.second_card_point
      lose_low_message
    elsif @select_num == HIGH_NUMBER && @master.first_card_point == @master.second_card_point
      draw_game_message
      calculate_draw_game
    end
    next_action
  end

  # <lowを選択した場合>
  def judge_low
    if @select_num == LOW_NUMBER && @master.second_card_point > @master.first_card_point
      lose_high_message
    elsif @select_num == LOW_NUMBER && @master.first_card_point > @master.second_card_point
      win_low_message
      calculate_win
      take_paid_message
    elsif @select_num == LOW_NUMBER && @master.first_card_point == @master.second_card_point
      draw_game_message
      calculate_draw_game
    end
    next_action
  end

  def calculate_win
    @paid = @bet * MAGNIFICATION_OF_MONEY
    @remaining_money = @player.paid_money(@paid.floor)
  end

  def calculate_win_low
    @paid = @bet * MAGNIFICATION_OF_MONEY
    @remaining_money = @player.paid_money(@paid.floor)
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
      if @player.money <= NO_MONEY
        game_over_message
        break
      elsif new_game_num == SELECT_NEW_GAME
        continue_game_message
        start
        @new_game_num = new_game_num
        break
      elsif new_game_num == SELECT_STOP_GAME
        stop_game_message
        break
      else
        error_ation_message
      end
    end
  end

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
end
