module Message
  def start_message
    puts <<~TEXT
      =*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=
              high_and_low
      =*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=

            ~ゲームスタート~
    TEXT
  end

  def give_bet_message(player)
    puts <<~TEXT

      現在の所持金は[＄#{player.money}]です
      賭け金を入力してください
    TEXT
  end

  def disp_bet_message
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

  def disp_card_message
    puts <<~TEXT
      -------------cards--------------
      1枚目 : #{first_card.card_info}
      2枚目 : 伏せている
      -------------cards--------------
    TEXT
  end

  def high_low_message
    puts <<~TEXT

      2枚目のカード値が
      'high' or 'low' であるかを当ててください(数値で入力)

      1.high 2.low
    TEXT
  end

  def high_message
    puts "highですね"
  end

  def low_message
    puts "lowですね"
  end

  def error_info_message
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

  def number_message
    puts <<~TEXT
      ----------------cards---------------------
      1枚目 :#{first_card.card_info}
      1枚目のカードの数字は[#{first_card_point}]です

      そして

      2枚目のカードの数字は[#{second_card_point}]です
      ----------------cards---------------------
    TEXT
  end

  # <high分岐>
  def win_high_message
    puts "\n2枚目の数字が'高い'ので、highを選んだあなたの勝ちです!"
  end

  def lose_high_message
    puts <<~TEXT

      2枚目の数字が'低い'ので、highを選んだあなたの負けです
      [＄#{bet}]を失いました

    TEXT
  end

  # <low分岐>
  def win_low_message
    puts "\n2枚目の数字が'低い'ので、lowを選んだあなたの勝ちです"
  end

  def lose_low_message
    puts <<~TEXT

      2枚目の数字が'高い'ので、lowを選んだあなたの負けです
      [＄#{bet}]を失いました

    TEXT
  end

  def draw_game_message
    puts "\n引き分けです。賭け金が戻されます"
  end

  def take_paid_message
    puts <<~TEXT

      賭け金が2倍になります！！
      [＄#{paid}]を手に入れました。
    TEXT
  end

  def next_action_message
    puts <<~TEXT

      ゲームを続けますか？

      現在の所持金 : ＄#{remaining_money}
      ---------------------------------

      1.ゲームを続ける 2.やめる
    TEXT
  end

  def continue_game_message
    puts <<~TEXT
      ゲームを続けるですね!!

          ~~NEXT GAME~~
    TEXT
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
