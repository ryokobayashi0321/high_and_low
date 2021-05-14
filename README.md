# high_and_lowゲーム

## Rubyだけで自作アプリ`「high_and_low」`ゲームを作成しました。

## ルール説明

1 賭け金を設定

2 masterが2枚カードを引きます（1枚目：表、　2枚目：裏）

3 playerが`1(high)` or `2(low)`　を選びます

  - `1(high)を選んだ場合`
    - 2枚目のカードの数が1枚目より高ければ勝ち、賭け金2倍
    - 2枚目のカードの数が1枚目より低ければ負け

  - `2(low)を選んだ場合`
    - 2枚目のカードの数が1枚目より高ければ負け
    - 2枚目のカードの数が1枚目より低けば勝ち、賭け金2倍

4 勝った場合
  - `ゲームを続ける`　or `止める` を選びます

5 `ゲームを続けるを選んだ場合`
  - `new game` に移行する

## インストール
```
$ git colne https://github.com/ryokobayashi0321/high_and_low.git
$ cd /ruby/high_and_low
$ ruby main.rb
```
