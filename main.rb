require "pry"
require_relative "high_and_low"

master = Master.new
player = Player.new
high_and_low = HighAndLow.new(master, player)

# ゲームスタート
high_and_low.start
