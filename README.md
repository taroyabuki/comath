# （仮）サポートサイト

## 実行環境とサンプルコード

### 推奨環境

システム|実行環境|コード
--|--|--
Wolfram\|Alpha|[Wolfram\|Alpha](https://www.wolframalpha.com/)|[クエリと結果](code/wolframalpha)
Python|Google Colab|[![Open in Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/taroyabuki/comath/blob/master/code/python.ipynb)
R|Google Colab|[![Open in Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/taroyabuki/comath/blob/master/code/r.ipynb)
Wolfram言語|[Wolfram Cloud](https://www.wolframcloud.com)|`Import["https://wolfr.am/1gw1DVIUK", "NB"]`
Wolfram言語|Mathematica|`Import["https://wolfr.am/1gw1HOigM", "NB"]` あるいは [mathematica.nb](code/mathematica/mathematica.nb)

- Google ColabとWolfram Cloudは，無料で使えますが登録が必要です．
- Google Colabでは，「&#8801;」のようなアイコンをクリックすると，目次が表示されます．
- Wolfram Cloudでは，新規ノートブックで`Import[...]`を評価すると，サンプルコードが読み込まれます．Ctrl-`A`（&#x2318;-`A`）で全選択→View→Close All Subgroupsで，みやすくなります．
- [Raspberry Pi OS版Mathematicaは無料です．](https://www.wolfram.com/raspberry-pi/)
### そのほかの環境

システム|実行環境|推奨Dockerイメージ|コード
--|--|--|--
Python|JupyterLab|[jupyter/datascience-notebook](https://hub.docker.com/r/jupyter/datascience-notebook)|[python.ipynb](code/python.ipynb)
R|JupyterLab|[jupyter/datascience-notebook](https://hub.docker.com/r/jupyter/datascience-notebook)|[r.ipynb](code/r.ipynb)
R|RStudio|[rocker/tidyverse](https://hub.docker.com/r/rocker/tidyverse)|[r.Rmd](code/r.Rmd)
Wolfram言語 13.3|JupyterLab||[wolfram.ipynb](code/mathematica/wolfram.ipynb)

- JupyterLabでは「&#8801;」のようなアイコン，RStudioでは「Outline」をクリックすると，目次が表示されます．
- Wolfram言語用のJupyterLabは，次の組合せで実現します（無料）．
    - [Wolfram Engine Community Edition](https://www.wolfram.com/engine/)
    - [Wolfram Language kernel for Jupyter notebooks](https://github.com/WolframResearch/WolframLanguageForJupyter)

### そのほかのコード

- 1.2.2項 [Pythonのモジュールの読み込み](code/imports.py)

## [リンク集](links.md)
