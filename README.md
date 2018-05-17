# same-cards

racket で書く神経衰弱ゲームシミュレータ。
学生の課題に標準解答をつける。
Simply Scheme 読み通し、
L99 に解答つけ、
DrRacket の GUI パーツの説明を一コマ以上受けた後、
1 週間以上かけてできないのは単なるサボり。
このくらい、1日以内で書かなくちゃ。

## FIXME

* misc.rkt で定義している partition で length を使っている。
  length 使わないよう、書き直し。take と drop を改良するんだろう。
  でもそれでスピードアップするんかな？

* シェルから実行するとエラーになる。

```
$ racket same-cards.rkt
'racket same-cards.rkt' terminated by signal SIGSEGV (Address boundary
error)
```

---
hiroshi . kimura . 0331 @ gmail . com
