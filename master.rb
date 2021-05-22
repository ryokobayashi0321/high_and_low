class Master
  attr_accessor :first_stages, :second_stages

  # ステージ(カードの置き場)生成
  def initialize
    @first_stages = []
    @second_stages = []
  end

  # 1枚目のカード引くメソッド
  def draw_first_card(deck)
    # drawの呼び出し
    @card = deck.draw
    @first_stages << @card
  end

  # 1枚目のカードを見せる
  def show_first_card
    puts "\n---------stage-----------"
    @first_stages.each.with_index(1) do |first_card, i|
      puts "#{i}枚目 : #{first_card.show}"
    end
  end

  # 2枚目のカードを引くメソッド
  def draw_second_card(deck)
    # drawの呼び出し
    @card = deck.draw
    @second_stages << @card
  end

  # 2枚目のカードを見せる
  def show_second_card
    @second_stages.each.with_index(2) do |second_card, i|
      puts "\n#{i}枚目 : #{second_card.show}"
    end
  end
end
