class Master
  attr_accessor :first_stages, :next_stages

  # ステージ(カードの置き場)生成
  def initialize
    @first_stages = []
    @next_stages = []
  end

  # 1枚目のカード引くメソッド
  def first_draw_card(deck)
    # drawの呼び出し
    @card = deck.draw
    @first_stages << @card
  end

  # 1枚目のカードを見せる
  def first_show_card
    puts "\n---------stage-----------"
    @first_stages.each.with_index(1) do |first_card, i|
      puts "#{i}枚目 : #{first_card.show}"

    end
  end

  # 2枚目のカードを引くメソッド
  def next_draw_card(deck)
    # drawの呼び出し
    @card = deck.draw
    @next_stages << @card
  end

  # 2枚目のカードを見せる
  def next_show_card
    @next_stages.each.with_index(2) do |next_card, i|
      puts "\n#{i}枚目 : #{next_card.show}"
    end
  end

end
