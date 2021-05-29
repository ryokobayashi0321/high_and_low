module Message
  def start_message
    puts <<~TEXT
      =*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=
              high_and_low
      =*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=

            ~ゲームスタート~
    TEXT
  end

  def input_bet_message(player)
    puts <<~TEXT

      現在の所持金は[＄#{player.money}]です
      賭け金を入力してください
    TEXT
  end

  def display_bet_message
    puts <<~TEXT
      *=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*
      賭け金 : ＄#{bet}
      残金 : ＄#{remaining_money}
      *=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*
    TEXT
  end

  def error_bet_message
    puts <<~TEXT
      ------------------------------------------
      error : 所持金の範囲で数値を入力してください
      ------------------------------------------
    TEXT
  end

  def drow_card_message
    puts <<~TEXT

      カードを2枚引きます。
      1枚目を表示します。

    TEXT
  end

  def show_first_card_message(master)
    master.first_stages.each.with_index(1) do |card, i|
      puts <<~TEXT
        ---------stage-----------
        #{i}枚目 : #{card.card_info}
        2枚目 : 伏せている
        ---------stage-----------
      TEXT
    end
  end

  def high_low_message
    puts <<~TEXT

      highかlowを決めてください(数値で入力)
      1.high 2.low
    TEXT
  end

  def high_message
    puts "highですね"
  end

  def low_message
    puts "lowですね"
  end

  def error_ation_message
    puts <<~TEXT

      --------------------------------
      error : 1か2を選択してください
      --------------------------------
    TEXT
  end

  def open_card_message
    puts <<~TEXT

      それではカードをめくります

    TEXT
  end

  def first_number_message(master)
    master.first_stages.each.with_index(1) do |card, i|
      puts <<~TEXT
        ---------stage-----------
        #{i}枚目 : #{card.card_info}
        1枚目のカードの数字は[#{first_point}]です

        そして
      TEXT
    end
  end

  def second_number_message
    puts <<~TEXT

      2枚目のカードの数字は[#{second_point}]です
      ---------stage-----------
    TEXT
  end

  def win_high_message
    puts "\n高いのであなたの勝ちです!"
  end

  def take_paid_message
    puts "[＄#{paid}]を手に入れました。"
  end

  def lose_low_message
    puts <<~TEXT

      低いのであなたの負けです
      [＄#{bet}]を失いました

      ゲームを続けますか？
    TEXT
  end

  def draw_game_message
    puts "\n引き分けです。賭け金が戻されます"
  end

  def lose_high_message
    puts <<~TEXT

      高いのであなたの負けです
      [＄#{bet}]を失いました

      ゲームを続けますか？
    TEXT
  end

  def win_low_message
    puts "\n低いのであなたの勝ちです"
  end

  def next_action_message
    puts <<~TEXT

      現在の所持金 : ＄#{remaining_money}
      ---------------------------------

      1.ゲームを続ける 2.やめる
    TEXT
  end

  def continue_game_message
    puts "ゲームを続けるですね"
  end

  def stop_game_message
    puts <<~TEXT
      やめるですね。

      あなたは[＄#{remaining_money}]を手に入れました。

      ゲームを終了します
    TEXT
  end

  def game_over_message
    puts <<~TEXT
      所持金が[＄0]になりました。

      *=*=*=*=*=*=*=*=*=*=*
          ゲームオーバー
      *=*=*=*=*=*=*=*=*=*=*
    TEXT
  end
end
