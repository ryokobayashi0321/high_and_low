require "./card"
require "./deck"
require "./master"
require "./player"
require "./message"

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

  def start

    # Messageモジュール1
    start_message

    # <deck生成>
    build_deck

    # <master生成>
    build_master

    # <playerの生成>
    build_player

    # <所持金の表示>、Messageモジュール2
    money_message1(@player)

    # <賭け金を提示する>
    present_stake(@player)

    # Messageモジュール5
    game_message1

    # <1枚目のカード引くメソッド>
    @master.first_draw_card(@deck)

    # <1枚目のカードを見せる>
    @master.first_show_card

    # Messageモジュール6
    game_message2

    # <2枚目のカードを引くメソッド>
    @master.next_draw_card(@deck)

    # Messageモジュール7
    game_message3

    while true
      # <highかlowの選択>
      select_num = gets.to_i
      if select_num == HIGH_NUMBER
        # Messageモジュール8
        game_message4
        @select_num = select_num
        break

      elsif select_num == LOW_NUMBER
        # Messageモジュール9
        game_message5
        @select_num = select_num
        break

      else
        # Messageモジュール10
        game_message6
      end
    end

    # Messageモジュール11
    game_message7

    # <1枚目のカードを見せる>
    @master.first_show_card

    # <1枚目のカードの数字の呼び出し>
    first_card_point

    # <2枚目のカードを見せる>
    @master.next_show_card

    # <2枚目のカードの数字の呼び出し>
    next_card_point

    # <判定の条件分岐>
    if @select_num == HIGH_NUMBER
      high_judge
    elsif @select_num == LOW_NUMBER
      low_judge
    end
  end

  private

  # <Deckの生成>
  def build_deck
    @deck = Deck.new
  end

  # <Masterの生成>
  def build_master
    @master = Master.new
  end

  # <Playerの生成>
  def build_player
    @player = Player.new
  end

  # <最初のカードの数字>
  def first_card_point
    @first_point = INITIAL_VALUE
    @master.first_stages.each do |first_card|
      @first_point = point(first_card)
    end
    # Messageモジュール12
    game_message8
  end

  # <次のカードの数字>
  def next_card_point
    @next_point = INITIAL_VALUE
    @master.next_stages.each do |next_card|
      @next_point = point(next_card)
    end
    # Messageモジュール13
    game_message9
  end

  # <highを選択した場合>
  def high_judge
      if  @select_num == HIGH_NUMBER && @next_point > @first_point
        # Messageモジュール14(win)
        game_message10
        @paid = @bet * MAGNIFICATION_OF_MONEY
        @remaining_money = @player.paid_money(@paid.floor)
        # Messageモジュール15
        money_message4
        next_action

      elsif @select_num == HIGH_NUMBER && @first_point > @next_point
        # Messageモジュール16(lose)
        game_message11
        game_over

      elsif @select_num == HIGH_NUMBER && @first_point == @next_point
        # Messageモジュール17(draw)
        game_message12
        @remaining_money = @player.paid_money(@bet)
        next_action
      end
  end

  # <lowを選択した場合>
  def low_judge
    if @select_num == LOW_NUMBER && @next_point > @first_point
      # Messageモジュール18(lose)
      game_message13
      game_over

    elsif @select_num == LOW_NUMBER && @first_point > @next_point
      # Messageモジュール19(win)
      game_message14
      @paid = @bet * MAGNIFICATION_OF_MONEY
      @remaining_money = @player.paid_money(@paid.floor)
      # Messageモジュール20
      money_message4
      next_action

    elsif @select_num == LOW_NUMBER && @first_point == @next_point
      # Messageモジュール21(draw)
      game_message12
      @remaining_money = @player.paid_money(@bet)
      next_action
    end
  end

  # <勝った場合>
  def next_action
    while true
      # Messageモジュール22
      next_action_message1

      new_game_num = gets.to_i
      if new_game_num == SELECT_NEW_GAME
        # Messageモジュール23
        next_action_message2
        start
        @new_game_num = new_game_num
        break

      elsif new_game_num == SELECT_STOP_GAME
        # Messageモジュール24
        next_action_message3
        break

      else
        # Messageモジュール25
        next_action_message4
      end
    end
  end

  # <所持金¥0の条件分岐>、Messageモジュール26
  def game_over
    money_message5 if @player.money <= NO_MONEY
  end


  # <カードの数字を表示>
  def point(card)
    if card.number == "A"
      return number = 1
    elsif card.number == "J"
      return number = 11
    elsif card.number == "Q"
      return number = 12
    elsif card.number == "K"
      return number = 13
    else
      return card.number.to_i
    end
  end

# <賭け金を提示する>
  def present_stake(player)
    while true
      @bet = gets.to_i
      # ¥1〜プレイヤーの所持金のみ入力できる
      if @bet.between?(MINIMUM_AMOUNT_OF_MONEY, player.money)
        @remaining_money = player.bet_money(@bet)
        # Messageモジュール3
        money_message2
        break
      else
        # Messageモジュール4
        money_message3
      end
    end
  end
end
