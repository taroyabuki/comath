# （仮）サポートサイト

## 実行環境とサンプルコード

### 推奨環境

システム|実行環境|メモ|コード
--|--|--|--
Wolfram\|Alpha|ウェブブラウザ|無料|[クエリと結果](code/wolframalpha)
Python|Google Colab|無料|[![Open in Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/taroyabuki/comath/blob/master/code/python.ipynb)
R|Google Colab|無料|[![Open in Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/taroyabuki/comath/blob/master/code/r.ipynb)
Wolfram言語|[Wolfram Cloud](https://www.wolframcloud.com)|無料|`Import["https://wolfr.am/1gw1DVIUK", "NB"]`
Wolfram言語|Mathematica|[Raspberry Pi OS版は無料](https://www.wolfram.com/raspberry-pi/)|[mathematica.nb](code/mathematica/mathematica.nb) あるいは `Import["https://wolfr.am/1gw1HOigM", "NB"]`

- Google ColabとWolfram Cloudは無料ですが登録が必要です．
- Google Colabでは「&#8801;」のようなアイコンをクリックすると，目次が表示されます．
- Wolfram Cloudでは，新規ノートブックで表の`Import[...]`を評価すると，サンプルコードが読み込まれます．Ctrl-`A`で全選択→View→Close All Subgroupsで，みやすくなります．
### そのほかの環境

システム|実行環境|メモ|コード
--|--|--|--
Python|JupyterLab（例：[jupyter/datascience-notebook](https://hub.docker.com/r/jupyter/datascience-notebook)）|無料|[python.ipynb](code/python.ipynb)
R|JupyterLab（例：[jupyter/datascience-notebook](https://hub.docker.com/r/jupyter/datascience-notebook)）|無料|[r.ipynb](code/r.ipynb)
R|RStudio（例：[rocker/tidyverse](https://hub.docker.com/r/rocker/tidyverse)）|無料|[r.Rmd](code/r.Rmd)
Wolfram言語 13.3|JupyterLab ([Wolfram Engine Community Edition](https://www.wolfram.com/engine/) + [Wolfram Language kernel for Jupyter notebooks](https://github.com/WolframResearch/WolframLanguageForJupyter))|無料|[wolfram.ipynb](code/mathematica/wolfram.ipynb)

- JupyterLabでは「&#8801;」のようなアイコン，RStudioでは「Outline」をクリックすると，目次が表示されます．

### そのほかのコード

- 1.2.2項 [Pythonのモジュールの読み込み](code/imports.py)

## [リンク集](links.md)
