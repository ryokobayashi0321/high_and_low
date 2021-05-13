class Deck
 attr_accessor :cards

 # デッキ生成
  def initialize
    @cards = []

    mk = ["スペード", "ハート", "ダイヤ", "クラブ"]
    num = ["A", "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K"]

    mk.each do |mark|
      num.each do |number|
        # card生成
        card = Card.new(mark, number)
        @cards << card
      end
    end

    @cards.shuffle!
  end

  # カードの取り出し
  def draw
    @cards.shift
  end

end
