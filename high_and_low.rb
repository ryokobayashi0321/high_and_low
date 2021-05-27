require_relative "card"
require_relative "deck"
require_relative "master"
require_relative "player"
require_relative "message"
class HighAndLow
  HIGH_NUMBER = 1
  LOW_NUMBER = 2
  INITIAL_VALUE = 0
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

    # <所持金の表示>
    input_bet_message(@player)

    # <賭け金を提示する>
    display_bet(@player)

    drow_card_message

    # <1枚目のカード引くメソッド>
    @master.draw_first_card(@deck)

    # <1枚目のカードを見せる>
    @master.show_first_card

    close_card_message

    # <2枚目のカードを引くメソッド>
    @master.draw_second_card(@deck)

    # <highかlowの選択>
    loop do
      high_low_message
      select_num = gets.to_i
      @select_num = select_num

      case select_num
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

    open_card_message

    # <1枚目のカードを見せる>
    @master.show_first_card

    # <1枚目のカードの数字の呼び出し>
    first_card_point

    # <2枚目のカードを見せる>
    @master.show_second_card

    # <2枚目のカードの数字の呼び出し>
    second_card_point

    # <判定の条件分岐>
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

  private

  # <最初のカードの数字>
  def first_card_point
    @first_point = INITIAL_VALUE
    @master.first_stages.each do |first_card|
      @first_point = point(first_card)
    end
    first_card_message
  end

  # <次のカードの数字>
  def second_card_point
    @second_point = INITIAL_VALUE
    @master.second_stages.each do |second_card|
      @second_point = point(second_card)
    end
    second_card_message
  end

  # <highを選択した場合>
  def judge_high
    if @select_num == HIGH_NUMBER && @second_point > @first_point
      win_high_message
      calculate_win_high
      take_paid_message
    elsif @select_num == HIGH_NUMBER && @first_point > @second_point
      lose_low_message
    elsif @select_num == HIGH_NUMBER && @first_point == @second_point
      draw_game_message
      draw_game
    end
    next_action
  end

  # <lowを選択した場合>
  def judge_low
    if @select_num == LOW_NUMBER && @second_point > @first_point
      lose_high_message
    elsif @select_num == LOW_NUMBER && @first_point > @second_point
      win_low_message
      calculate_win_low
      take_paid_message
    elsif @select_num == LOW_NUMBER && @first_point == @second_point
      draw_game_message
      draw_game
    end
    next_action
  end

  def calculate_win_high
    @paid = @bet * MAGNIFICATION_OF_MONEY
    @remaining_money = @player.paid_money(@paid.floor)
  end

  def calculate_win_low
    @paid = @bet * MAGNIFICATION_OF_MONEY
    @remaining_money = @player.paid_money(@paid.floor)
  end

  def draw_game
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

  # # <カードの数字を表示>
  def point(card)
    case card.number
    when "A"
      1
    when "J"
      11
    when "Q"
      12
    when "K"
      13
    else
      card.number.to_i
    end
  end

  # <賭け金を提示する>
  def display_bet(player)
    loop do
      @bet = gets.to_i
      # ¥1〜プレイヤーの所持金のみ入力できる
      if @bet.between?(MINIMUM_AMOUNT_OF_MONEY, player.money)
        @remaining_money = player.bet_money(@bet)
        display_bet_message
        break
      else
        error_bet_message
      end
    end
  end
end
