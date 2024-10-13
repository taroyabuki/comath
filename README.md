[オーム社](https://www.ohmsha.co.jp/) ／ 理工学専門書 ／ 理学 ／ 数学 ／ [コンピュータでとく数学](https://www.ohmsha.co.jp/book/9784274231797/)

# コンピュータでとく数学（オーム社, 2024）サポートサイト

**データサイエンスのための統計・微分積分・線形代数**

Wolfram|Alpha，Python，R，Mathematicaをフル活用して，大学教養レベルの統計，微分積分，線形代数の全体像を把握する．学び直しにも最適な一冊．

- [書店へのリンク集（版元ドットコム）](https://www.hanmoto.com/bd/isbn/9784274231797)
- [国会図書館](https://ndlsearch.ndl.go.jp/books/R100000002-I033398783)

![書影](https://www.ohmsha.co.jp/Portals/0/book/small/978-4-274-23179-7.jpg)

コンピュータ（**Wolfram|Alpha**，**Python**，**R**，**Mathematica**）を活用して，数学の学びの質を高めましょう．

本書の具体的な目標は，**線形回帰分析**を理解することです．そのために必要な微分積分と線形代数も学びます．微分積分は**多変数の微分積分**まで，線形代数は**特異値分解**までです．これで，大学教養レベルの数学はほぼ網羅できます．

すべてが線形回帰分析につながるので，何の役に立つのかと疑うことはありません．面倒な計算はコンピュータにまかせるので，計算に迷い込んでしまうこともありません．

線形回帰分析は**データサイエンス**（**人工知能**・**機械学習**）の出発点です．本書を読んで，データサイエンスにおいて必要とされる数学力とプログラミング力を身に付けましょう．

大学教養レベルの数学の全体像の把握，学び直しにも最適な一冊です．

## [更新情報・正誤表](update.md)

## 目次

**第I部　入門**

1. 実行環境
2. 数と変数
3. データ構造
4. 可視化と方程式
5. 論理式

**第II部　統計**

6. 1次元のデータ
7. 2次元のデータ
8. 確率変数と確率分布
9. 多次元の確率分布
10. 推測統計
11. 線形回帰分析

**第III部　微分積分**

12. 関数の極限と連続性
13. 微分
14. 積分
15. 多変数関数の微分積分

**第IV部　線形代数**

16. ベクトル
17. 行列
18. ベクトル空間
19. 固有値と固有ベクトル
20. 特異値分解と擬似逆行列

## 実行環境とコード

目次を表示させると見やすくなります[^1]．

### 推奨環境

システム|コード|実行結果
--|--|--
[Wolfram\|Alpha](https://www.wolframalpha.com/)|[リンク集](code/wolframalpha)|[キャプチャ画像](code/wolframalpha/results/README.md)
Python (JupyterLab)|[![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/taroyabuki/comath/HEAD?labpath=code%2Fpython%2Fpython-binder.ipynb)
R (JupyterLab)|[![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/taroyabuki/comath/HEAD?labpath=code%2Fr%2Fr-binder.ipynb)|[Knit to HTML](https://taroyabuki.github.io/comath/python.html)
R (RStudio)|[![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/taroyabuki/comath/HEAD?urlpath=rstudio)[^2]|[Knit to HTML](https://taroyabuki.github.io/comath/r.html)
[Wolfram Cloud](https://www.wolframcloud.com)|動的生成[^3]|
Mathematica（[Pi版は無料](https://www.wolfram.com/raspberry-pi/)）|[mathematica.nb](code/mathematica/mathematica.nb)[^4]|[PDF](code/mathematica/results/mathematica-results.pdf)

### そのほかの環境

システム|コード|実行結果
--|--|--
Python (Google Colab)|[![Open in Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/taroyabuki/comath/blob/master/code/python/python.ipynb)|[![Open in Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/taroyabuki/comath/blob/master/code/python/python-results.ipynb)
R (Google Colab)|[![Open in Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/taroyabuki/comath/blob/master/code/r/r.ipynb)|[![Open in Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/taroyabuki/comath/blob/master/code/r/r-results.ipynb)
Wolfram言語 (JupyterLab[^5])|[wolfram.ipynb](code/mathematica/wolfram.ipynb)


### そのほかのコード

- [Pythonで使用するモジュールの一括読込（1.2.2項）](code/imports.py)

[^1]: JupyterLabとGoogle Colabでは「&#8801;」のようなアイコン，RStudioでは「Outline」をクリックします．Wolfram CloudとMathematicaでは，Ctrl-`A`（&#x2318;-`A`）で全選択→View→Close All Subgroupsで全てのセルを閉じます．
[^2]: code/r/r.Rmdを開いてください．
[^3]: 無料アカウントではノートブックをアップロードできないので，新規作成したノートブックで，`Import["https://raw.githubusercontent.com/taroyabuki/comath/main/code/mathematica/createnb.m", "NB"]`を実行し，コードを読み込みます．
[^4]: ダウンロードボタンをクリックしてダウンロードするか，Mathematicaで新規作成したノートブックで，`NotebookWrite[EvaluationNotebook[], Import["https://raw.githubusercontent.com/taroyabuki/comath/main/code/mathematica/mathematica.nb", "NB"]]`を実行して読み込みます．
[^5]: Wolfram言語用のJupyterLabは，[Wolfram Engine Community Edition](https://www.wolfram.com/engine/)と[Wolfram Language kernel for Jupyter notebooks](https://github.com/WolframResearch/WolframLanguageForJupyter)を組み合わせて実現します（無料）．
