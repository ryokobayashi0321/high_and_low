require "pry"
require_relative "high_and_low"

master = Master.new
player = Player.new
deck = Deck.new
high_and_low = HighAndLow.new(master, player, deck)

# ゲームスタート
high_and_low.start
