# 更新情報・正誤表

## 更新情報

- 2024/04 文献[17]の改訂版が出版されました．
- p.90 SymPy 1.13.0以降を使う場合は，Lを計算するPythonのコードを，次のように変更してください（`a * x`を`x * a`にする）．

```
var('a b'); L = sum((y - (x * a + b))**2); L
```

- p.235の積分は次のようにした方がうまく行くことが多そうです（本書で扱っている例の結果は変わりません）．

不定積分の計算方法を変えて，正しい結果を得ます．

```
s = SolveValues[And[F1x == 0, -Pi < x <= 0], x][[1]];
F2x = Integrate[f[t], {t, s, x}, Assumptions -> Element[x, Reals]];
(F2x /. x -> 2 Pi) - (F2x /. x -> 0) (* 正解 *)
```

- p.310 Python (Numpy) では，対称行列専用の`linalg.eigh`を使うのが簡単です．

```
Sn = np.array([[2, 2, -2], [2, 5, -4], [-2, -4, 5]])
vals, Q = linalg.eigh(Sn) # ①, ②, ③
L = np.diag(vals)         # ④
Q, L, np.allclose(Sn, Q @ L @ Q.T)
```

## 正誤表

場所|誤|正
--|--|--
p.28 (2.10)|$2^{b-1023_{10}}$|$2^{e-1023_{10}}$
p.28 (2.10)の下の行|$s$は2桁の数|$s$は1桁の数
p.65 注意点2の1, 3行目|$x \gt 11x$|$x \gt 11$
p.185 (11.28)|$r_{y\hat y}=r_{yx}$|$r_{y\hat y}^2=r_{yx}^2$
p.308 本文下から2行目|$\Lambda:=\Sigma$|$\Lambda:=Q^\top SQ$ あるいは $\Lambda:=V^\top SV$
p.309 Wolfram\|Alpha|`svd`|`diagonalize`
p.309 Python (SymPy)|`Q, L, V = S.singular_value_decomposition()`|`Q, L, V = S.singular_value_decomposition(); L = Q.T @ S @ Q`
p.309 Python (NumPy)|`Q, lambdas, tV = linalg.svd(Sn); L = np.diag(lambdas)`|`Q, lambdas, tV = linalg.svd(Sn); L = Q.T @ Sn @ Q`
p.309 R|`tmp <- svd(S); Q <- tmp$u; d <- tmp$d; L <- diag(d, length(d)); V <- tmp$v`|`tmp <- svd(S); Q <- tmp$u; V <- tmp$v; L <- t(Q) %*% S %*% Q`
p.309 Mathematica|`{Q, L, V} = SingularValueDecomposition[S];`|`{Q, L, V} = SingularValueDecomposition[S]; L = Simplify[Transpose[Q] . S . Q];`
p.309 本文4行目|ここで確認した|次に確認する
p.317 Pythonのコード|`s2 = pca2.explained_variance_ratio_`|`s2 = pca2.singular_values_**2`
