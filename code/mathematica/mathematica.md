---
jupyter:
  kernelspec:
    display_name: Wolfram Language 13.3
    name: wolframlanguage13.3
---
# 1 実行環境

```code
data = {{1, 7}, {3, 1}, {6, 6}, {10, 14}};
model = LinearModelFit[data, X1, X1]
model["BestFitParameters"]
```

# 2 数と変数

```code
2 * (-3)
```

```code
2 (-3)
```

```code
(1 + 2) * 3
```

```code
2^10
```

```code
-2 < -1
```

```code
2 + 2 == 5
```

```code
x<1
```

```code
x == y
```

```code
x^2 - 1 == (x + 1) (x - 1) // Simplify
```

```code
Not[0<1]
```

```code
Or[0<1,2>3]
```

```code
And[0<1,2>3]
```

```code
Not[10<x]
```

```code
x = 5; x == 5
```

```code
a = 1 + 2;
b = 9;
a(b + 1)
```

```code
a = 1 + 2; b = 9; a * (b + 1)
```

```code
a = 1 + 2
```

```code
x1 = 2; x2 = 3; x1 + x2
```

```code
Subscript[x, 1] = 2; Subscript[x, 2] = 3; Subscript[x, 1] + Subscript[x, 2]
```

```code
x = 1; y = x + 1; x = 2; y
```

```code
x = 1;
y := x + 1; (* yは「2」ではなく「x + 1」になる．*)
x = 2;
y (* 「x + 1」は「2 + 1」つまり3．*)
```

```code
Clear[x]; (* xをリセットする．*)
f = 2 x + 3;
f /. x -> 5
```

```code
Clear[a, b, c, y];
g = a + b;
g /. {a -> x, b -> y}
```

```code
f = Function[x, 2 x + 3];
f[5]
```

```code
Clear[f];
f[x_] := 2 x + 3
f[5]
```

```code
Clear[f, a];
f = Function[x, 2 x + 3];
g = f[a];
{f[5], g /. a -> 5}
```

```code
Clear[f];
f[x_] := 1 / x
f[1] (* 1 *)
```

```code
Clear[f1, f2, f3, f4];
f1[x_] := Piecewise[{{1/x, x != 0}}, Undefined]

f2[0] = Undefined;
f2[x_] := 1/x

f3[0] = Undefined;
f3[x_ /; x != 0] := 1/x

f4[x_] := If[x != 0, 1/x, Undefined]

{f1[1], f2[1], f3[1], f4[1]} (* 全て1 *)
{f1[0], f2[0], f3[0], f4[0]} (* 全てUndefined *)
```

```code
Function[x, 2 x + 3][5]
```

```code
f[x_, y_] := x + y
f[2, 3]
```

```code
Clear[g];
g[x_] := x[[1]] + x[[2]]
x = {2, 3}; g[x]
```

```code
g[{x1_, x2_}] := x1 + x2
g[x] (* 5 *)
```

```code
Apply[f, x]
```

```code
g[{2, 3}]
```

```code
Clear[x];
Expand[(x + 1)^2]
```

```code
N[Sqrt[2], 30]
```

```code
a = 2^^1001100110011001100110011001100110011001100110011010;
b = 2^^01111111011 - 1023;
(1 + a/2^52) 2^b
```

```code
pi2 = FromDigits[RealDigits[N[Pi], 2], 2]
pi10 = FromDigits[RealDigits[N[Pi], 10], 10]
Abs[Pi - pi2] < Abs[Pi - pi10] (* True *)
```

```code
0.1 + 0.1 + 0.1 == 0.3
```

```code
1/10 + 1/10 + 1/10
```

```code
Block[{Internal`$EqualTolerance = 0}, 0.1 + 0.1 + 0.1 == 0.3]
```

```code
Clear[x];
Simplify[Sin[x]^2 + Cos[x]^2]
```

```code
FullSimplify[Sqrt[5 + 2 Sqrt[6]]]
```

```code
Simplify[Sqrt[(x - 1)^2], x - 1 >= 0]
```

```code
Reduce[Sqrt[(x - 1)^2] == x - 1, x, Reals]
```

```code
Clear[a, b];
Reduce[Sqrt[a] Sqrt[b] == Sqrt[a b], Reals]
```

# 3 データ構造

```code
v = {2, 3, 5}; Length[v]
```

```code
v[[3]] = 4; v
```

```code
Range[5]
```

```code
Range[0, 1, 0.1]
```

```code
Subdivide[0, 100, 4]
```

```code
v = {2, 3};
10 v
```

```code
u = Table[0, 2];
Do[u[[i]] = 10 v[[i]], {i, 1, 2}];
u
```

```code
u = {10, 20}; v = {2, 3}
u + v
```

```code
v + 1
```

```code
(* vの各成分をxという名前で取り出し，x + 1を計算する．*)
Table[x + 1, {x, v}]
```

```code
u = {10, 20}; v = {2, 3}
u . v
```

```code
x = <|"apple" -> "りんご", "orange" -> "みかん"|>;
x["orange"]
```

```code
AppendTo[x, "grape" -> "ぶどう"];
x["grape"]
```

```code
x["apple"] =.
KeyExistsQ[x, "apple"]
```

```code
Clear[x];
x["apple"] = "りんご"
x["orange"] = "みかん"

x["orange"] (* みかん *)

x["grape"] = "ぶどう"
x["grape"] (* ぶどう *)

x["apple"] =.
Head[x["apple"]] != x (* False *)
```

```code
df = Transpose[Dataset[<|"name" -> {"A", "B", "C"},
                         "english" -> {60, 90, 70},
                         "math" -> {70, 80, 90},
                         "gender" -> {"f", "m", "m"}|>]]
```

```code
df = Dataset[{
   <|"name" -> "A", "english" -> 60, "math" -> 70, "gender" -> "f"|>,
   <|"name" -> "B", "english" -> 90, "math" -> 80, "gender" -> "m"|>,
   <|"name" -> "C", "english" -> 70, "math" -> 90, "gender" -> "m"|>}]
```

```code
df[All, {"english", "math"}]
```

```code
df[[All, "english"]]
```

```code
m = Normal[df[[All, {2, 3}]][[Values]]]
```

```code
{english, math} = Transpose[m]
```

# 4 可視化と方程式

```code
Plot[x^2 + 2 x - 4, {x, -5, 3}]
```

```code
x = Subdivide[-5, 3, 100];
y = x^2 + 2 x - 4;
ListLinePlot[Transpose[{x, y}]]
```

```code
Plot[Sin[102 x], {x, 0, 2 Pi}, PlotPoints -> 100]
```

```code
Plot3D[x^2 + y^2, {x, -1, 1}, {y, -1, 1}, AxesLabel -> {"x", "y"}]
```

```code
ContourPlot[x^2 + y^2, {x, -1, 1}, {y, -1, 1}]
```

```code
reg1 = ImplicitRegion[x^2 + y^2 == 1, {x, y}]; Clear[x, y];
Region[reg1, Axes -> True]
```

```code
reg2 = ImplicitRegion[x^2 + y^2 <= 1, {x, y}];
Region[reg2, Axes -> True]
```

```code
{RegionMeasure[reg1], RegionMeasure[reg2]}
```

```code
Manipulate[
 reg = ImplicitRegion[x^3 + y^3 - 3 x y == c, {x, y}];
 Region[reg, Axes -> True],
 {{c, 0}, -1, 1}] (* cは-1以上1以下で，初期値は0 *)
```

```code
reg = ImplicitRegion[Or[2 x + 3 y == 8, 5 x - 7 y == -9], {x, y}];
Region[reg, Axes -> True]
```

```code
reg = ImplicitRegion[And[y <= x, y >= x^2], {x, y}];
RegionPlot[reg]
```

```code
RegionMeasure[reg]
```

```code
Clear[x];
{a, b} = Sort[SolveValues[{x == x^2}, x]];
Integrate[x - x^2, {x, a, b}]
```

```code
SolveValues[x^2 + 2 x - 4 == 0, x]
```

```code
{a, b} = SolveValues[x^2 + 2 x - 4 == 0, x]
a + b

tmp = Solve[x^2 + 2 x - 4 == 0, x]
{a, b} = x /. tmp;
a + b

tmp = Reduce[x^2 + 2 x - 4 == 0, x]
{a, b} = x /. {ToRules[tmp]};
a + b
```

```code
n = 3; Simplify[Total[SolveValues[x^n + 2 x - 4 == 0, x]]]
```

```code
Clear[x, y];
sol = SolveValues[{2 x + 3 y == 8, 5 x - 7 y == -9}, {x, y}]
```

```code
{{x1, y1}} = sol; x1 + y1
```

```code
f[x_] := 2^x + Sin[x]
FindRoot[f[x] == 0, {x, 0}]
```

```code
Reduce[x^2 + 2 x - 4 < 0, x]
```

# 5 論理式

```code
expr = Exists[x, Element[x, Reals], x^2 == 2];
Reduce[expr]
```

```code
Reduce[Implies[10 < x, 11 < x]]
```

```code
Reduce[ForAll[x, Element[x, Reals], Implies[10 < x, 11 < x]]]
```

```code
BooleanConvert[Implies[A, B], "OR"] (* 含意 *)
```

```code
BooleanConvert[And[A, B], "OR"] (* 論理積 *)
```

```code
{BooleanConvert[Not[A]] == BooleanConvert[Nand[A, A]],
 BooleanConvert[Or[A, B]] == BooleanConvert[Nand[Not[A], Not[B]]]}
```

```code
Reduce[Exists[x, Element[x, Reals], x^2 == 2]]
```

```code
Reduce[Exists[x, x^2 == 2], Reals]
```

```code
Reduce[Exists[x, Element[x, Rationals], x^2 == 2]]
```

```code
expr = ForAll[b, Element[b, Reals], Exists[n, Element[n, Integers], n > b]];
Reduce[expr]
```

```code
expr1 = ForAll[b,
   Element[b, Reals], Exists[n, And[Element[n, Integers], n > b]]];
Reduce[expr1] (* True *)

expr2 = ForAll[b,
   Implies[Element[b, Reals], Exists[n, Element[n, Integers], n > b]]];
Reduce[expr2] (* 失敗 *)
```

```code
Clear[a, b, x];
Reduce[Exists[x, a x + b == 0]]
```

```code
Reduce[Exists[x, Element[x, Reals], x^2 + a^2 == 0]]
```

```code
Reduce[Exists[x, Element[x, Reals], x^2 + a^2 < 0]] (* False *)
```

```code
Reduce[Exists[x, Element[x, Reals], x^2 + a^2 < 0], Complexes] // Simplify
```

# 6 1次元のデータ

```code
a = {36, 43, 53, 55, 56, 56, 57, 60, 61, 73};
b = {34, 39, 39, 49, 50, 52, 52, 55, 83, 97};
```

```code
Histogram[a]
```

```code
HistogramList[a, {20, 80, 20}]
```

```code
x = {7, 3, 1, 3, 4, 7, 7, 7, 10, 3};
f = Counts[x]
```

```code
BoxWhiskerChart[{a, b}, "Outliers", ChartLabels -> {"A", "B"}]
```

```code
Mean[a]
```

```code
Total[b]/Length[b]
```

```code
Mean[a - Mean[a]]
```

```code
Variance[a]
```

```code
Total[(b - Mean[b])^2]/(Length[b] - 1) // N
```

```code
z = Standardize[a]
```

```code
{Mean[z], StandardDeviation[z]}
```

```code
(a - Mean[a])/StandardDeviation[a]
```

```code
StandardDeviation[a] z + Mean[a]
```

```code
10 * z + 50
```

# 7 2次元のデータ

```code
x = {35, 45, 55, 65, 75}; y = {114, 124, 143, 158, 166};
ListPlot[Transpose[{x, y}]]
```

```code
Covariance[x, y]
```

```code
Covariance[Transpose[{x, y}]]
```

```code
(x - Mean[x]) . (y - Mean[y])/(Length[x] - 1)
```

```code
Correlation[x, y] // N
```

```code
x = {35, 45, 55, 65, 75}; y = {114, 124, 143, 158, 166};
data = Thread[{x, y}]; Clear[X];
model = LinearModelFit[data, X, X]
```

```code
model[40]
```

```code
Show[ListPlot[data], Plot[Normal[model], {x, 35, 75}]]
```

```code
Clear[a, b];
L = Total[(y - (a x + b))^2];
tmp = Reduce[ForAll[{a, b}, L == p (a - q)^2 + r (b - (s a + t))^2 + u]]
{q, s q + t} /. ToRules[tmp]
```

```code
a = Covariance[x, y]/Variance[x]; b = Mean[y] - a Mean[x];
{a, b} // N
```

```code
anscombe = ExampleData[{"Statistics", "AnscombeRegressionLines"}];
x1 = anscombe[[All, 1]]; y1 = anscombe[[All, 5]]; data = Thread[{x1, y1}];
Correlation[x1, y1]
Clear[x]; model = LinearModelFit[data, x, x]
Show[ListPlot[data], Plot[Normal[model], {x, 0, 21}]]
```

# 8 確率変数と確率分布

```code
dist = DiscreteUniformDistribution[{1, 6}];
PDF[dist][2]
```

```code
Probability[X == 2, Distributed[X, dist]]
```

```code
data = RandomVariate[dist, 1000];
Histogram[data] (* 結果は割愛 *)
```

```code
Show[Histogram[data, {0.5, 6.5, 1}, "PDF"],
 DiscretePlot[PDF[dist][x], {x, 1, 6}]]
```

```code
dist = BernoulliDistribution[3/10];
data = RandomVariate[dist, 1000];
Counts[data]
```

```code
dist = BinomialDistribution[10, 3/10];
PDF[dist][3]
```

```code
Probability[X == 3, Distributed[X, dist]] // N
```

```code
dist = BinomialDistribution[n, p];
PDF[dist][x]
```

```code
n = 10; p = 3/10; dist = BinomialDistribution[n, p];
data = RandomVariate[dist, 1000];
Histogram[data] (* 結果は割愛 *)
```

```code
Show[Histogram[data, {-0.5, n + 0.5, 1}, "PDF"],
 DiscretePlot[PDF[dist][x], {x, 0, n}]]
```

```code
dist = BinomialDistribution[10, 3/10];
CDF[dist][3] // N
```

```code
Probability[X <= 3, Distributed[X, dist]]
```

```code
Sum[PDF[dist][k], {k, 0, 3}] // N
```

```code
dist = UniformDistribution[{0, 360}];
{CDF[dist][200], CDF[dist][150], CDF[dist][200] - CDF[dist][150]}
```

```code
Probability[150 <= X <= 200, Distributed[X, dist]]
```

```code
Integrate[PDF[dist][x], {x, 150, 200}]
```

```code
Integrate[PDF[dist][t], {t, 0, x}, Assumptions -> Element[x, Reals]]
```

```code
D[x/360, x]
```

```code
data = RandomVariate[dist, 1000];
Histogram[data] (* 結果は割愛 *)
```

```code
data = RandomVariate[dist, 1000];
Show[Histogram[data, {"Raw", "Sturges"}, "PDF"],
 Plot[PDF[dist][x], {x, 0, 360}]]
```

```code
dist = NormalDistribution[6, 2];
CDF[dist][6 + 3 2] - CDF[dist][6 - 3 2] // N
```

```code
Probability[6 - 3 2 <= X <= 6 + 3 2, Distributed[X, dist]] // N
```

```code
Integrate[PDF[dist][x], {x, 6 - 3 2, 6 + 3 2}] // N
```

```code
dist = NormalDistribution[mu, sigma];
CDF[dist][mu + 3 sigma] - CDF[dist][mu - 3 sigma] // N (* 方法1 *)
Probability[mu - 3 sigma <= X <= mu + 3 sigma,
  Distributed[X, dist]] // N (* 方法2 *)
```

```code
dist = NormalDistribution[mu, sigma];
PDF[dist][x]
```

```code
Plot[{PDF[NormalDistribution[0, 1]][x],
      PDF[NormalDistribution[2, 1]][x]}, {x, -6, 6}]
```

```code
Plot[{PDF[NormalDistribution[0, 1]][x],
      PDF[NormalDistribution[0, 2]][x]}, {x, -6, 6}]
```

```code
Xs = {0, 100, 1000, 10000}; Ps = {0.9, 0.08, 0.015, 0.005};
tmp = Piecewise[Thread[{Ps, Thread[x == Xs]}]];
dist = ProbabilityDistribution[tmp, {x, 0, 10000, 1}]; (* 確率分布の定義 *)
data = RandomVariate[dist, 1000];
Counts[data] (* <|0->900,100->77,1000->18,10000->5|> *)
```

```code
dist = ProbabilityDistribution[Abs[x], {x, -1, 1}]; (* 確率分布の定義 *)
data = RandomVariate[dist, 1000];
Histogram[data]
```

```code
Clear[f, F, t, x];
f[x_] := RealAbs[x]                            (* 手順1 *)
F[x_] := Evaluate[Integrate[f[t], {t, -1, x}]] (* 手順2 *)
Finv = InverseFunction[F];                     (* 手順3 *)
data = Table[Finv[RandomReal[]], {1000}];      (* 手順4 *)
Histogram[data]                                (* 手順5 *)
```

```code
distY = UniformDistribution[{0, 1}];
distX = TransformedDistribution[
   Piecewise[{{-Sqrt[1 - 2 Y], Y <= 1/2}}, Sqrt[-1 + 2 Y]],
   Distributed[Y, distY]];
PDF[distX]
```

```code
distX = DiscreteUniformDistribution[{1, 6}];
distY = TransformedDistribution[Mod[X^3, 4], Distributed[X, distX]];
data = RandomVariate[distY, 1000];
Histogram[data]
```

```code
distX = UniformDistribution[{0, 1}];
distY = TransformedDistribution[X^2, Distributed[X, distX]];
data = RandomVariate[distY, 1000];
Histogram[data]
```

```code
PDF[distY]
```

```code
distX = ProbabilityDistribution[Abs[x], {x, -1, 1}];
distY = TransformedDistribution[X^2, Distributed[X, distX]];
PDF[distY]
```

```code
dist = NormalDistribution[mu, sigma]; Clear[a, b];
TransformedDistribution[a X + b, Distributed[X, dist]]
```

```code
Xs = {0, 100, 1000, 10000}; Ps = {0.9, 0.08, 0.015, 0.005};
tmp = Piecewise[Thread[{Ps, Thread[x == Xs]}]];
dist = ProbabilityDistribution[tmp, {x, 0, 10000, 1}];
Expectation[X, Distributed[X, dist]]
```

```code
Mean[dist]
```

```code
Sum[x PDF[dist][x], {x, Xs}]
```

```code
Xs . Ps
```

```code
Mean[RandomVariate[dist, 500000]] // N
```

```code
Clear[n, p];
dist = BinomialDistribution[n, p];
Expectation[X, Distributed[X, dist]]       (* 方法1 *)
Mean[dist]                                 (* 方法2 *)
Sum[x PDF[dist][x], {x, 0, n}] // Simplify (* 方法3 *)
```

```code
dist = ProbabilityDistribution[Abs[x], {x, -1, 1}];
Integrate[x PDF[dist][x], {x, -1, 1}]
```

```code
Xs = {0, 100, 1000, 10000}; Ps = {0.9, 0.08, 0.015, 0.005};
tmp = Piecewise[Thread[{Ps, Thread[x == Xs]}]];
dist = ProbabilityDistribution[tmp, {x, 0, 10000, 1}];
Variance[dist]
```

```code
Expectation[(X - Mean[dist])^2, Distributed[X, dist]]
```

```code
Sum[(x - Mean[dist])^2 PDF[dist][x], {x, Xs}]
```

```code
((Xs - Xs . Ps)^2) . Ps
```

```code
Clear[n, p];
dist = BinomialDistribution[n, p];
Variance[dist]                                              (* 方法1 *)
Expectation[(X - Mean[dist])^2, Distributed[X, dist]]       (* 方法2 *)
Sum[(x - Mean[dist])^2 PDF[dist][x], {x, 0, n}] // Simplify (* 方法3 *)
```

```code
dist = ProbabilityDistribution[Abs[x], {x, -1, 1}];
Integrate[(x - Mean[dist])^2 PDF[dist][x], {x, -1, 1}]
```

# 9 多次元の確率分布

```code
dist = DiscreteUniformDistribution[{1, 6}];
Probability[Conditioned[X == 2, X <= 3], Distributed[X, dist]]
```

```code
distX = DiscreteUniformDistribution[{1, 6}];
distXY = TransformedDistribution[{X, Mod[X, 4]}, Distributed[X, distX]];
Association[Table[
  {{x, y} -> Probability[And[X == x, Y == y], Distributed[{X, Y}, distXY]]},
  {x, 1, 6}, {y, 0, 3}]]
```

```code
distX = DiscreteUniformDistribution[{1, 6}];
distY = TransformedDistribution[Mod[X, 4], Distributed[X, distX]];
distXY = TransformedDistribution[{X, Y},
   {Distributed[X, distX], Distributed[Y, distY]}];
```

```code
PDF[MarginalDistribution[distXY, 1]][x]
PDF[MarginalDistribution[distXY, 2]][y]
```

```code
Association[Table[
  {{x, y} -> Probability[And[X <= x, Y <= y], Distributed[{X, Y}, distXY]]},
  {x, 1, 6}, {y, 0, 3}]]
```

```code
Mean[distXY]                (* 平均 *)
Variance[distXY]            (* 分散 *)
StandardDeviation[distXY]   (* 標準偏差 *)
Covariance[distXY][[1, 2]]  (* 共分散 *)
Correlation[distXY][[1, 2]] (* 相関係数 *)
```

```code
{uX, uY} = Mean[distXY]; {sX, sY} = StandardDeviation[distXY];
Expectation[{X, Y,           (* 平均 *)
   (X - uX)^2, (Y - uY)^2,   (* 分散 *)
   (X - uX) (Y - uY),        (* 共分散 *)
   (X - uX) (Y - uY)/sX/sY}, (* 相関係数 *)
  Distributed[{X, Y}, distXY]] // Simplify
```

```code
tmp = Distributed[X, distX];
Sum[x Probability[X == x, tmp], {x, 1, 6}]                   (* Xの平均 *)
Sum[(x - uX) (y - uY) Probability[And[X == x, Y == y], tmp], (* 共分散 *)
 {x, 1, 6}, {y, 0, 3}]
```

```code
distX = DiscreteUniformDistribution[{1, 6}];
distXY = TransformedDistribution[{X, Mod[X, 4]}, Distributed[X, distX]];
tmp = Distributed[{X, Y}, distXY];
Table[Probability[And[X <= x, Y <= y], tmp], {x, 1, 6}, {y, 0, 3}] ==
 Table[Probability[X <= x, tmp] Probability[Y <= y, tmp],
  {x, 1, 6}, {y, 0, 3}]
```

```code
distU = DiscreteUniformDistribution[{1, 6}];
distXY = TransformedDistribution[{Mod[U, 2], Mod[U, 3]},
   Distributed[U, distU]];
tmp = Distributed[{X, Y}, distXY];
Table[Probability[And[X <= x, Y <= y], tmp], {x, 0, 1}, {y, 0, 2}] ==
 Table[Probability[X <= x, tmp] Probability[Y <= y, tmp],
  {x, 0, 1}, {y, 0, 2}]
```

```code
distX = BinomialDistribution[3, 1/2];
distXY = TransformedDistribution[
   {X, Piecewise[{{1, Or[X == 0, X == 3]}}, 2]}, Distributed[X, distX]];
Covariance[distXY][[1, 2]]
```

```code
tmp = Distributed[{X, Y}, distXY];
Table[Probability[And[X <= x, Y <= y], tmp], {x, 0, 3}, {y, 1, 2}] ==
 Table[Probability[X <= x, tmp] Probability[Y <= y, tmp],
  {x, 0, 3}, {y, 1, 2}]
```

```code
distX = DiscreteUniformDistribution[{1, 6}];
distXY = TransformedDistribution[{X, Mod[X, 4]}, Distributed[X, distX]];
distY = MarginalDistribution[distXY, 2];
distXplusY = TransformedDistribution[X + Y, Distributed[{X, Y}, distXY]];
{Mean[distXplusY],
 Variance[distXplusY],
 Variance[distX] + Variance[distY] + 2 Covariance[distXY][[1, 2]]}
```

```code
Manipulate[
 distY = BinomialDistribution[n, p];
 mu = Mean[distY]; sigma = StandardDeviation[distY];
 distZ = NormalDistribution[mu, sigma];
 Show[DiscretePlot[PDF[distY][x], {x, 0, n}], Plot[PDF[distZ][x], {x, 0, n}]],
 {{n, 20}, 1, 40, 1}, {{p, 3/10}, 0, 1}]
```

```code
distX = UniformDistribution[]; distZ = NormalDistribution[];
data = Table[Total[RandomVariate[distX, 12]] - 6, {10000}];
Show[Histogram[data, Automatic, "PDF"], Plot[PDF[distZ][x], {x, -4, 4}]]
```

```code
dist1 = NormalDistribution[0, 2]; dist2 = NormalDistribution[1, 1];
TransformedDistribution[{X1 + X2 + 2, X1 + 3 X2 + 3},
 {Distributed[X1, dist1], Distributed[X2, dist2]}]
```

```code
mu = {3, 6}; Sigma = {{5, 7}, {7, 13}};
dist = MultinormalDistribution[mu, Sigma];
Plot3D[PDF[dist][{Y1, Y2}], {Y1, -8, 14}, {Y2, -5, 17},
 PlotPoints -> 100, PlotRange -> All, AxesLabel -> Automatic]
```

```code
ContourPlot[PDF[dist][{Y1, Y2}], {Y1, -8, 14}, {Y2, -5, 17}, PlotPoints -> 50]
```

```code
sol = Solve[{Y1 == X1 + X2 + 2, Y2 == X1 + 3 X2 + 3}, {X1, X2}][[1]]
```

```code
J = D[{X1, X2} /. sol, {{Y1, Y2}}];
absj = Abs[Det[J]]
```

```code
f1 = PDF[dist1]; f2 = PDF[dist2];
PDF[dist][{Y1, Y2}] == f1[X1] f2[X2] absj /. sol // Simplify
```

```code
{MarginalDistribution[dist, 1], MarginalDistribution[dist, 2]}
```

```code
Clear[x1, x2];
dist = MultinormalDistribution[{u1, u2}, {{v1, 0}, {0, v2}}];
d1 = MarginalDistribution[dist, 1]; d2 = MarginalDistribution[dist, 2];
Simplify[CDF[dist][{x1, x2}] == CDF[d1][x1] CDF[d2][x2],
 And[v1 >= 0, v2 >= 0]]
```

# 10 推測統計

```code
dist = NormalDistribution[2, 3];
data1 = Table[Mean[RandomVariate[dist, 5]], 10000];
data2 = Table[Mean[RandomVariate[dist, 50]], 10000];
{{Mean[data1], Variance[data1]}, {Mean[data2], Variance[data2]}}
```

```code
GraphicsRow[{Histogram[data1], Histogram[data2]}]
```

```code
data1 = Table[Variance[RandomVariate[dist, 5]], 10000];
data2 = Table[Variance[RandomVariate[dist, 50]], 10000];
{{Mean[data1], Variance[data1]}, {Mean[data2], Variance[data2]}}
```

```code
GraphicsRow[{Histogram[data1], Histogram[data2]}]
```

```code
n = 4; mu = 5; sigma = 7; dist := NormalDistribution[mu, sigma];
f[x_] := (n - 1) Variance[x]/sigma^2
data = Table[f[RandomVariate[dist, n]], 10000];
Show[Histogram[data, Automatic, "PDF"],
 Plot[PDF[ChiSquareDistribution[n - 1]][x], {x, 0, Max[data]}]]
```

```code
n = 4; mu = 5; sigma = 7; ndist = NormalDistribution[mu, sigma];
t = Function[{x}, (Mean[x] - mu)/Sqrt[Variance[x]/n]];
data = Table[t[RandomVariate[ndist, n]], 10000];
Show[Histogram[data, Automatic, "PDF"],
 Plot[PDF[StudentTDistribution[n - 1]][x], {x, -5, 5}]]
```

```code
m = 5; muX = 2; sigmaX = 3; distX = NormalDistribution[muX, sigmaX];
n = 7; muY = 3; sigmaY = 2; distY = NormalDistribution[muY, sigmaY];
f[x_, y_] := (Variance[x]/sigmaX^2)/(Variance[y]/sigmaY^2)
data = Table[f[RandomVariate[distX, m], RandomVariate[distY, n]], {10000}];
Show[Histogram[data, Automatic, "PDF"],
 Plot[PDF[FRatioDistribution[m - 1, n - 1]][x], {x, 0, 7}]]
```

```code
TransformedDistribution[T^2, Distributed[T, StudentTDistribution[k]]]
```

```code
n = 15; p0 = 4/10; dist = BinomialDistribution[n, p0];
tmp = Table[PDF[dist][x], {x, 0, n}];
Total[Select[tmp, Function[x, x <= PDF[dist][2]]]] // N
```

```code
CDF[dist][2] // N
```

```code
n = 15; p0 = 4/10; dist = NormalDistribution[n p, Sqrt[n p (1 - p)]];
2 CDF[dist /. p -> p0][2] // N
```

```code
alpha = 5/100; InverseCDF[dist /. {p -> p0}, {alpha/2, 1 - alpha/2}] // N
```

```code
N[Reduce[InverseCDF[dist][alpha/2] <= 2 <= InverseCDF[dist][1 - alpha/2], p]]
```

```code
pvalue[p0_] := With[{c = CDF[dist][2] /. p -> p0}, 2 Min[c, 1 - c]]
Plot[pvalue[p0], {p0, 0, 1}]

Plot[{InverseCDF[dist, alpha/2], InverseCDF[dist, 1 - alpha/2], 2},
 {p, 0, 1}, PlotStyle -> {Dashed, Thick, Dotted}]
```

```code
x = {24.2, 25.3, 26.2, 25.7, 24.4, 25.1, 25.6}; mu0 = 25;
TTest[x, mu0]
```

```code
m = Mean[x]; s2 = Variance[x]; n = Length[x];
t := (m - mu0)/Sqrt[s2/n];
dist = StudentTDistribution[n - 1]; c = CDF[dist][t];
2 Min[c, 1 - c]
```

```code
region = {a, b} = InverseCDF[dist, {alpha/2, 1 - alpha/2}] // N
```

```code
Needs["HypothesisTesting`"]
MeanCI[x]
```

```code
Clear[mu0]; Reduce[a <= t <= b, mu0]
```

```code
dist = StudentTDistribution[n - 1];
Reduce[InverseCDF[dist, alpha/2] <= t <= InverseCDF[dist, 1 - alpha/2]]
```

```code
x = {25, 24, 25, 26}; y = {23, 18, 22, 28, 17, 25, 19, 16};
TTest[{x, y}, 0, AlternativeHypothesis -> "Greater",
 VerifyTestAssumptions -> "EqualVariance" -> False]
```

```code
alpha = 5/100;
m = Length[x]; n = Length[y]; sx2 = Variance[x]; sy2 = Variance[y];
s2 = ((m - 1) sx2 + (n - 1) sy2)/(m + n - 2);
T = (Mean[x] - Mean[y] - d)/Sqrt[s2 (1/m + 1/n)];
t := T /. d -> 0 (* t値 *)
df = m + n - 2; (* 自由度 *)
dist := StudentTDistribution[df];
P := 1 - CDF[dist][t]; (* P値 *)
a := InverseCDF[dist, 1 - alpha]; (* 採択域の上限 *)
interval := Reduce[T <= a, d] (* 信頼区間 *)
{t, P, a, interval} // N
```

```code
T = (Mean[x] - Mean[y] - d)/Sqrt[sx2/m + sy2/n];
df = (sx2/m + sy2/n)^2/((sx2/m)^2/(m - 1) + (sy2/n)^2/(n - 1)) // N;
{t, P, a, interval} // N
```

```code
x = {25, 24, 25, 26}; y = {23, 18, 22, 28, 17, 25, 19, 16};
VarianceTest[{x, y}, 1, "HypothesisTestData"]["TestDataTable"]
```

```code
m = Length[x]; n = Length[y]; dist = FRatioDistribution[m - 1, n - 1];
F = Variance[x]/Variance[y]/r; f = F /. r -> 1;
c = CDF[dist][f];
{f, 2 Min[c, 1 - c]} // N
```

```code
alpha = 5/100;
{a, b} = InverseCDF[dist, {alpha/2, 1 - alpha/2}] // N
```

```code
Needs["HypothesisTesting`"]
VarianceRatioCI[x, y]
```

```code
Reduce[a <= F <= b, r]
```

# 11 線形回帰分析

```code
data = {{1, 2, 3}, {1, 3, 6}, {2, 5, 3}, {3, 7, 6}};
model = LinearModelFit[data, {X1, X2}, {X1, X2}]
model["BestFitParameters"]
```

```code
model[1.5, 4]
```

```code
x1 = {1, 3, 6, 10}; y = {7, 1, 6, 14};
e = y - (b0 + b1 x1);
L = e . e;
FindMinimum[L, {{b0, 0}, {b1, 0}}]
```

```code
Minimize[L, {b0, b1}] (* 解析的な結果 *)
```

```code
L = Total[Abs[e]]; (* 差の絶対値の和 *)
Minimize[L, {b0, b1}]
```

```code
e = x1 - (y - b0)/b1;
L = e . e;
Minimize[L, {b0, b1}]
```

```code
line = Module[{x1, y}, ImplicitRegion[y == b0 + b1 x1, {x1, y}]];
L = Sum[RegionDistance[line, p]^2, {p, Thread[{x1, y}]}];
Minimize[L, {b0, b1}] // Simplify // N
```

```code
data = {{1, 2, 3}, {1, 3, 6}, {2, 5, 3}, {3, 7, 6}};
X = DesignMatrix[data, {X1, X2}, {X1, X2}];
y = data[[All, -1]];
Inverse[Transpose[X] . X] . Transpose[X] . y
```

```code
PseudoInverse[X] . y
```

```code
b = {b0, b1, b2};
L = (y - X . b) . (y - X . b);
Reduce[{D[L, {b}] == {0, 0, 0}}]
```

```code
D[L, {b}] == -2 Transpose[X] . y + 2 Transpose[X] . X . b // Simplify
```

```code
data = {{1, 2, 3}, {1, 3, 6}, {2, 5, 3}, {3, 7, 6}};
model = LinearModelFit[data, {X1, X2}, {X1, X2}];
model["RSquared"]
```

```code
x1 = {1, 3, 6, 10}; y = {7, 1, 6, 14}; data = Thread[{x1, y}];
X = DesignMatrix[data, X1, X1];
yh = X . PseudoInverse[X] . y;
eh = y - yh; fh = yh - Mean[y]; g = y - Mean[y];
R2 = 1 - eh . eh/g . g; N[R2]
```

```code
{Mean[eh] == 0,                            (* 特徴1 *)
 Mean[yh] == Mean[y],                      (* 特徴2 *)
 g . g == fh . fh + eh . eh,               (* 特徴3 *)
 R2 == fh . fh/g . g,                      (* 特徴4 *)
 R2 == Correlation[y, yh]^2,               (* 特徴5 *)
 0 <= R2 <= 1,                             (* 特徴6 *)
 Correlation[y, yh] == Correlation[y, x1]} (* 特徴7 *)
```

```code
X = {{1, 1, 2}, {1, 1, 3}, {1, 2, 5}, {1, 3, 7}};
{n, p} = Dimensions[X];
beta = Table[Subscript[\[Beta], i - 1], {i, p}];
epsilon = Table[Subscript[\[Epsilon], i], {i, n}];
Y = X . beta + epsilon;
betah = PseudoInverse[X] . Y // Simplify
```

```code
Clear[sigma];
udist = UniformDistribution[{-Sqrt[3] sigma, Sqrt[3] sigma}];
udists = Table[Distributed[v, udist], {v, epsilon}];
Expectation[betah, udists]
```

```code
Z = {{1, 0, 0}, {0, 1, 0}, {0, 0, 1}, {0, 0, 0}};
Cz = Inverse[Transpose[Z] . X] . Transpose[Z];
b = Cz . Y;
Expectation[b, udists]
```

```code
dist1 = TransformedDistribution[b, udists];
dist2 = TransformedDistribution[betah, udists];
Eigenvalues[Covariance[dist1] - Covariance[dist2]]
```

```code
Variance[dist1]
Variance[dist2]
```

```code
ndist = NormalDistribution[0, sigma];
ndists = Table[Distributed[v, ndist], {v, epsilon}];
TransformedDistribution[betah, ndists] ==
 MultinormalDistribution[beta, sigma^2 Inverse[Transpose[X] . X]]
```

```code
data = {{1, 2, 3}, {1, 3, 6}, {2, 5, 3}, {3, 7, 6}};
model = LinearModelFit[data, {X1, X2}, {X1, X2}];
model["EstimatedVariance"]
```

```code
e = Y - X . betah; RSS = e . e;
s2 = RSS/(n - p) // Simplify
```

```code
Expectation[s2, udists]
```

```code
tmp = Block[{sigma = 2},
   dist = TransformedDistribution[(n - p) s2/sigma^2, ndists];
   RandomVariate[dist, 10000]];
cdist = ChiSquareDistribution[n - p];
Show[Histogram[tmp, Automatic, "PDF"],
 Plot[PDF[cdist][x], {x, 0, 5}, PlotRange -> {0, 2}]]
```

```code
n := Length[data]; p := Length[data[[1]]]; Clear[x];
vars := Table[Subscript[x, i], {i, p - 1}]
X := DesignMatrix[data, vars, vars]; y := data[[All, -1]]
yh := X . PseudoInverse[X] . y; e := y - yh;

data = {{1, 2, 3}, {1, 3, 6}, {2, 5, 3}, {3, 7, 6}};
Module[{F, fdist},
  F = Total[(yh - Mean[y])^2]/(p - 1)/(e . e/(n - p));
  fdist = FRatioDistribution[p - 1, n - p];
  {F, 1 - CDF[fdist][F]}] // N
```

```code
betah := PseudoInverse[X] . y; uh := Transpose[A] . betah
M := Transpose[A] . Inverse[Transpose[X] . X] . A
r := MatrixRank[A]
RSS := e . e; s2 := RSS/(n - p)
F := ((uh - u) . Inverse[M] . (uh - u)/r)/s2
fdist := FRatioDistribution[r, n - p]
pvalue := 1 - CDF[fdist, F]

A = Transpose[{{0, 1, 0}, {0, 0, 1}}]; u = {0, 0};
{F, pvalue} // N
```

```code
model := LinearModelFit[data, vars, vars]
model["ParameterTable"]
```

```code
u = {0};
A = Transpose[{{1, 0, 0}}]; pvalue // N (* k = 0 *)
A = Transpose[{{0, 1, 0}}]; pvalue // N (* k = 1 *)
A = Transpose[{{0, 0, 1}}]; pvalue // N (* k = 2 *)
```

```code
s := Sqrt[s2 Diagonal[Inverse[Transpose[X] . X]]]
s // N
```

```code
t := betah/s
t // N
```

```code
tdist := StudentTDistribution[n - p]
Table[2 Min[CDF[tdist][v], 1 - CDF[tdist][v]], {v, t}] // N
```

```code
data = Transpose[{{35, 45, 55, 65, 75}, {114, 124, 143, 158, 166}}];
alpha = 5/100; level := ConfidenceLevel -> 1 - alpha
model["ParameterConfidenceIntervalTable", level]
```

```code
tmp = InverseCDF[tdist, 1 - alpha/2];
{betah - s tmp, betah + s tmp} // Transpose // N
```

```code
cond := F <= InverseCDF[fdist, 1 - alpha]
confint := Reduce[cond]
A = Transpose[{{1, 0}}]; u = {beta0}; confint // N (* k = 0 *)
A = Transpose[{{0, 1}}]; u = {beta1}; confint // N (* k = 1 *)
```

```code
tmp = model["ParameterConfidenceIntervals", level]
g1 = Graphics[{Gray, Apply[Rectangle, Transpose[tmp]]}];
g2 = Graphics[model["ParameterConfidenceRegion", level]];
Show[g1, g2, AspectRatio -> 1, Frame -> True]
```

```code
A = {{1, 0}, {0, 1}}; u = {beta0, beta1};
g3 = RegionPlot[ImplicitRegion[N[cond], Evaluate[u]]];
Show[g1, g3, AspectRatio -> 1, Frame -> True]
```

```code
data = Transpose[
   {{35, 45, 55, 65, 75}, {2, 3, 5, 7, 11}, {114, 124, 143, 158, 166}}];
data0 = data[[All, {1, 3}]];
model0 = LinearModelFit[data0, X1, X1];
model1 = LinearModelFit[data, {X1, X2}, {X1, X2}];
{{model0["RSquared"], model0["AdjustedRSquared"]},
 {model1["RSquared"], model1["AdjustedRSquared"]}} // TableForm
```

```code
Module[{n, p, r, AR20, AR21, RSS0, RSS1, S, F}, (* Sは全変動 *)
 AR20 = 1 - RSS0/(n - (p - r))/(S/(n - 1));
 AR21 = 1 - RSS1/(n - p)/(S/(n - 1));
 F = (RSS0 - RSS1)/r/(RSS1/(n - p));
 FullSimplify[Reduce[Equivalent[AR21 <= AR20, F <= 1], Reals],
  And[S > 0, RSS0 > 0, RSS1 > 0, n > p > 1, r > 0]]]
```

```code
With[{n = 5, p = 3, r = 1}, 1 - CDF[FRatioDistribution[r, n - p]][1]] // N
```

```code
data = Transpose[{{35, 45, 55, 65, 75}, {114, 124, 143, 158, 166}}];
alpha = 5/100; level := ConfidenceLevel -> 1 - alpha
g = Show[ListPlot[data], Plot[model[x1], {x1, 35, 75}],
  Plot[Evaluate[model["MeanPredictionBands", level]],
   Evaluate[{vars[[1]], 35, 75}], PlotStyle -> Dashed]]
```

```code
Clear[Y];
A = {{1}, {vars[[1]]}}; u = {Y};
Show[g, RegionPlot[Evaluate[cond],
  Evaluate[{vars[[1]], 35, 75}], {Y, 0, 200}, BoundaryStyle -> None]]
```

# 12 関数の極限と連続性

```code
Clear[f]; f[x_] := 2 x - 3
Limit[f[x], x -> 1]
```

```code
Limit[2 x - 3, x -> 1]
```

```code
f[x_] := Piecewise[{{x^2, x != 2}, {3, x == 2}}]
Limit[f[x], x -> 2]
```

```code
Clear[g]; g[x_] := (x^2 - 2)/(x - Sqrt[2])
Limit[g[x], x -> Sqrt[2]]
```

```code
Clear[epsilon, delta];
A := ForAll[epsilon, epsilon > 0, Exists[delta, delta > 0, B]];
B := ForAll[x, Element[x, Reals],
  Implies[0 < Norm[x - a] < delta, Norm[f[x] - alpha] < epsilon]]

f[x_] := 2 x - 3; a = 1; alpha = -1;
Reduce[A, Reals]
```

```code
Simplify[Reduce[B, Reals], epsilon > 0]
```

```code
Clear[alpha];
Reduce[A, Reals]
```

```code
Limit[(1 + 1/x)^x, x -> Infinity]
```

```code
Limit[1/x^2, x -> 0]
```

```code
{Limit[RealAbs[x]/x, x -> 0, Direction -> "FromAbove"],
 Limit[RealAbs[x]/x, x -> 0, Direction -> "FromBelow"]}
```

```code
Clear[f, g, x];
f[x_] := Piecewise[{{RealAbs[x]/x, x != 0}}, Undefined]
g[x_] := Piecewise[{{(x^2 - 2)/(x - Sqrt[2]), x != Sqrt[2]}}, Undefined]

ResourceFunction["EnhancedPlot"][f[x], {x, -1, 1}, "FindExceptions" -> True]
ResourceFunction["EnhancedPlot"][g[x], {x, 0, 2},  "FindExceptions" -> True]
```

```code
FunctionContinuous[{f[x], x != 0}, x]       (* True *)
FunctionContinuous[{g[x], x != Sqrt[2]}, x] (* True *)
```

# 13 微分

```code
f[x_] := x^3
f'[1]
```

```code
a = 1;
Limit[(f[a + h] - f[a])/h, h -> 0]
```

```code
f[x_] := x^3
f'[x]
```

```code
f[x_] := x^3
f1 = f'         (* Derivative[1][f]も可 *)
f2 = D[f[x], x] (* f'[x]も可 *)
```

```code
{f1[1], f2 /. x -> 1}
```

```code
D[x^3, {x, 2}]
```

```code
Clear[f, g, a, b, t, x];
f[t_] := t^2
g[x_] := a x + b
Composition[f, g]'[x]                (* ① *)
D[f[g[x]], x]                        (* ② *)
(D[f[t], t] /. t -> g[x]) D[g[x], x] (* ③ *)
f'[g[x]] g'[x]                       (* ④ *)
```

```code
tmp = Series[Sin[x], {x, 0, 5}]
```

```code
Plot[Evaluate[{Normal[tmp], Sin[x]}], {x, -Pi, Pi}]
```

```code
a = 0; Sum[Derivative[k][Sin][a] (x - a)^k/k!, {k, 0, 5}]
```

```code
f[x_] := Sqrt[1 + x]
Series[f[x], {x, 0, 7}]
```

```code
fn[n_, a_, x_] := Sum[Derivative[k][f][a] (x - a)^k/k!, {k, 0, n},
  GenerateConditions -> True]
Reduce[f[x] == fn[Infinity, 0, x], Reals]
```

```code
f[x_] := Piecewise[{{Exp[-1/x^2], x != 0}}, 0]
Plot[f[x], {x, -1, 1}]
Reduce[f[x] == fn[Infinity, 0, x], Reals]
```

```code
Derivative[k][f][0]
```

```code
f[x_] := x^3 - 12 x
Plot[f[x], {x, -4, 4}]
ResourceFunction["LocalExtrema"][f[x], x]
```

```code
sol = SolveValues[f'[x] == 0, x]
Series[f[x], {x, sol[[1]], 2}]
```

```code
Clear[a, delta];
f[x_] := Piecewise[{{Exp[-1/x^2], x != 0}}, 0]
Reduce[Exists[delta, delta > 0, ForAll[x, Element[x, Reals],
   Implies[0 < Norm[x - a] < delta, f[a] < f[x]]]], Reals]
```

# 14 積分

```code
Integrate[-x^2 + 4 x + 1, {x, 1, 4}]
```

```code
f[x_] := -x^2 + 4 x + 1
Clear[n]; a = 1; b = 4; h = (b - a)/n;
s = Sum[f[a + k h] h, {k, 1, n}] // Expand
Limit[s, n -> Infinity]
```

```code
Clear[a, x]; Integrate[-x^2 + 4 x + 1, {x, a, x}]
```

```code
Integrate[-x^2 + 4 x + 1, x]
```

```code
Clear[x, y];
DSolveValue[y'[x] == -x^2 + 4 x + 1, y[x], x]
```

```code
DSolveValue[{y'[x] == -x^2 + 4 x + 1, y[0] == 1}, y[x], x]
```

```code
tmp = DSolveValue[y'[x] == -x y[x], y[x], x]
```

```code
Reduce[Integrate[tmp, {x, -Infinity, Infinity}] == 1]
```

```code
Clear[a, f, t, x];
Function[x, Evaluate[Integrate[f[t], {t, a, x}]]]'
```

```code
D[Integrate[f[t], {t, a, x}], x]
```

```code
F = Integrate[-x^2 + 4 x + 1, x];
(F /. x -> 4) - (F /. x -> 1)
```

```code
f[x_] := 1/(2 + Cos[x])
F1x = Integrate[f[x], x];
(F1x /. x -> 2 Pi) - (F1x /. x -> 0) (* 不正解 *)
```

```code
F2x = Integrate[f[t], {t, 0, x}, GenerateConditions -> True];
(F2x /. x -> 2 Pi) - (F2x /. x -> 0) (* 正解 *)
```

```code
GraphicsRow[{Plot[F1x, {x, 0, 2 Pi}], Plot[F2x, {x, 0, 2 Pi}]}]
```

```code
Clear[p, q, u, x];
Integrate[(p x + q)^100, x]
```

```code
tmp = IntegrateChangeVariables[
  Inactive[Integrate][(p x + q)^100, x], u, u == p x + q]
Activate[tmp] /. u -> p x + q
```

```code
Clear[x, y];
IntegrateChangeVariables[
 Inactive[Integrate][1, {x, 0, t}], y, x == Sqrt[y]]
```

```code
Integrate[1/x^a, {x, 0, 1}]
```

```code
Integrate[1/x^a, {x, 1, Infinity}]
```

# 15 多変数関数の微分積分

```code
Clear[x1, x2]; x = {x1, x2}; f[{x1_, x2_}] := x1 x2^2/(x1^2 + x2^2)
Limit[f[x], x -> {0, 0}]
```

```code
A := ForAll[epsilon, epsilon > 0, Exists[delta, delta > 0, B]];
B := ForAll[Evaluate[x], Element[x, Reals],
  Implies[0 < Norm[x - a] < delta, Norm[f[x] - alpha] < epsilon]]
```

```code
a = {0, 0}; alpha = 0;
Reduce[A, Reals]
```

```code
Clear[alpha];
Reduce[A, Reals]
```

```code
Clear[x, y]; f[x_, y_] := x^2 y/(x^4 + y^2)
Limit[f[x, y], {x, y} -> {0, 0}]
```

```code
Clear[x, y, r, theta];
{Limit[Limit[f[x, y], x -> 0], y -> 0],
 Limit[Limit[f[x, y], y -> 0], x -> 0],
 Limit[f[r Cos[theta], r Sin[theta]], r -> 0],
 Limit[f[x, x^2], x -> 0]}
```

```code
f[{x1_, x2_}] := Piecewise[{{0, x1 == x2 == 0}}, x1 x2^2/(x1^2 + x2^2)]
x = {x1, x2};
FunctionContinuous[f[x], x]           (* True *)
Limit[f[x], x -> {0, 0}] == f[{0, 0}] (* True *)
```

```code
f[x_, y_] := Piecewise[{{0, x == y == 0}}, x^2 y/(x^4 + y^2)]
Clear[x, y]; FunctionContinuous[f[x, y], {x, y}] (* False *)
```

```code
f[x_, y_] := 2 - x^2 - y^2
{D[f[x, y], x], D[f[x, y], y]}
```

```code
{Derivative[1, 0][f], Derivative[0, 1][f]}
```

```code
g[{x1_, x2_}] := 2 - x1^2 - x2^2
{Derivative[{1, 0}][g], Derivative[{0, 1}][g]}
```

```code
D[f[x, y], {{x, y}}]
(* あるいは *)
Grad[f[x, y], {x, y}]
```

```code
f[x_, y_] := 2 x^3 + 5 x y + 2 y^2
D[f[x, y], {{x, y}, 2}]
```

```code
Clear[f, F]; f[{x1_, x2_}] := Sqrt[x1^2 + x2^2]
x = {x1, x2}; a = {1, 1}; h = x - a;
F[t_] := f[a + t h]
expr := Normal[Series[F[t], {t, 0, 2}]] /. t -> 1
expr // Simplify
```

```code
Block[{h = {h1, h2}},
 expr /. Thread[h -> Map[HoldForm, x - a]]]
```

```code
gradf = D[f[x], {x}] /. Thread[x -> a];
H = D[f[x], {x, 2}] /. Thread[x -> a];
f[a] + gradf . (x - a) + (x - a) . H . (x - a)/2 // Simplify
```

```code
x = {x1, x2}; f[{x1_, x2_}] := 2 x1^3 + x1 x2^2 + 5 x1^2 + x2^2
ResourceFunction["LocalExtrema"][f[x], x]
```

```code
points := Solve[D[f[x], {x}] == 0 x, x, Reals]; (* 停留点 *)
H := D[f[x], {x, 2}];                           (* ヘッセ行列 *)
Table[With[{h = H /. p},                        (* 停留点でのヘッセ行列 *)
  {p, f[x] /. p, Which[
    PositiveDefiniteMatrixQ[h], -1,             (* 極小 *)
    NegativeDefiniteMatrixQ[h], 1,              (* 極大 *)
    IndefiniteMatrixQ[h], 0,                    (* 極値ではない *)
    True, Null]}],                              (* 不明 *)
 {p, points}]
```

```code
x = {x1, x2}; f[{x1_, x2_}] := x1^2 + x1^4 + x2^4
PositiveDefiniteMatrixQ[H /. Thread[x -> {0, 0}]] (* False *)
ResourceFunction["LocalExtrema"][f[x], x]
```

```code
d = ImplicitRegion[And[0 <= x <= 1, 0 <= y <= x], {x, y}];
f[x_, y_] := x^2 + y^2; Clear[x, y];
Integrate[f[x, y], Element[{x, y}, d]]
```

```code
Integrate[Integrate[f[x, y], {y, 0, x}], {x, 0, 1}]
```

```code
Integrate[Integrate[f[x, y], {x, y, 1}], {y, 0, 1}]
```

```code
Clear[u, v, x, y];
lhs = Inactive[Integrate][f[x, y], Element[{x, y}, d]]
rhs = IntegrateChangeVariables[lhs, {u, v}, {x == 2 u, y == 3 v}]
{Activate[lhs], Activate[rhs]}
```

```code
f[x_, y_] := x^2 + y^2
{x, y} = {2 u, 3 v};
J = D[{x, y}, {{u, v}}];
detJ = Det[J]
Integrate[Integrate[f[x, y] Abs[detJ], {v, 0, 2 u/3}], {u, 0, 1/2}]
```

```code
{x, y} = {r Cos[theta], r Sin[theta]};
J = D[{x, y}, {{r, theta}}];
Det[J] // Simplify
```

```code
Clear[x, y];
lhs = Inactive[Integrate][Exp[-(x^2 + y^2)],
  {y, -Infinity, Infinity}, {x, -Infinity, Infinity}]
rhs = IntegrateChangeVariables[lhs, {r, theta}, "Cartesian" -> "Polar"]
{Activate[lhs], Activate[rhs]}
```

# 16 ベクトル

```code
100 {1, 2} + 10 {3, 1}
```

```code
a = {1/10 + 1/10 + 1/10, 1}; b = {3/10, 1};
a == b
```

```code
a = {3, 4};
Norm[a]
```

```code
Clear[x, y]; a = {x, y}; Sqrt[a . a]
```

```code
a = {3, 4};
Normalize[a]
```

```code
a = {1, 0}; b = {1, 1};
ArcCos[a . b/(Norm[a] Norm[b])]
```

```code
VectorAngle[a, b]
```

# 17 行列

```code
A = {{1, 2, 0}, {0, 3, 4}};
A // MatrixForm
```

```code
SymmetricMatrixQ[{{1, 2}, {2, 3}}]
```

```code
A = {{11, 12, 13}, {21, 22, 23}, {31, 32, 33}};
```

```code
A[[All, 3]]
```

```code
A[[2, All]] (* A[[2]]も可 *)
```

```code
A[[1 ;; 2, 1 ;; 2]]
```

```code
10 {{2, 3}, {5, 7}}
```

```code
{{10, 20}, {30, 40}} + {{2, 3}, {4, 5}}
```

```code
A = {{2, 3}, {5, 7}}; B = {{1, 2}, {3, 4}};
A . B
```

```code
A = {{2, 3}, {5, 7}}; b = {1, 3};
A . b
```

```code
b . A
```

```code
Clear[a1, a2, x1, x2, p, q, r, s];
x = {x1, x2}; a = {a1, a2};
G = {{p, q}, {q, s}}; A = {{p, q}, {r, s}};
D[a . x, {x}] == a
D[x . G . x, {x}] == 2 G . x // Simplify
D[(A . x) . (A . x), {x}] == 2 Transpose[A] . A . x // Simplify
```

```code
RegionMeasure[Parallelepiped[{0, 0}, {{3, 1}, {2, 2}}]]
```

```code
RegionMeasure[Parallelepiped[{0, 0, 0}, {{2, 1, 0}, {0, 2, 1}, {1, 1, 1}}]]
```

```code
A = {{3, 2}, {1, 2}}; b = {8, 4};
Inverse[A] . b
```

```code
RowReduce[{{4, 2, 8}, {2, 1, 4}}]
```

# 18 ベクトル空間

```code
a1 = {3, 1}; a2 = {2, 2};
ResourceFunction["LinearlyIndependent"][{a1, a2}]
```

```code
Reduce[c1 a1 + c2 a2 == {0, 0}]
```

```code
A = {{1, 0, 1}, {1, 1, 0}, {0, 1, -1}};
ResourceFunction["ColumnSpace"][A]["Basis"]
```

```code
A = {{1, 0, 1}, {1, 1, 0}, {0, 1, -1}};
tmp = ResourceFunction["ColumnSpace"][A];
basis = Orthogonalize[tmp["Basis"]]
```

```code
Q = Transpose[basis];
Transpose[Q] . Q
```

```code
A = {{1, 0, 1}, {1, 1, 0}, {0, 1, -1}};
{Qt, R} = QRDecomposition[A]; Q = Transpose[Qt];
{MatrixForm[Q], MatrixForm[R], MatrixForm[Q . R]}
```

```code
A = {{1, 0}, {1, 1}, {0, 1}};
NullSpace[Transpose[A]]
```

```code
Clear[a, b, c, d, f, s, t, u, x, y]; A = {{a, b}, {c, d}};
f[x_] := A . x
R = ParametricRegion[{x, y}, {{x, s, s + u}, {y, t, t + u}}];
Rp = TransformedRegion[R, f];
{RegionMeasure[Rp], Abs[Det[A]] u^2}
```

# 19 固有値と固有ベクトル

```code
A = {{2, 1}, {4, -1}};
eigs = Eigensystem[A]
```

```code
Solve[Det[x IdentityMatrix[2] - A] == 0, x]
```

```code
Clear[x, y]; Reduce[(3 IdentityMatrix[2] - A) . {x, y} == {0, 0}, {x, y}]
```

```code
S = {{2, 2, -2}, {2, 5, -4}, {-2, -4, 5}};
{Q, L, V} = SingularValueDecomposition[S];
{MatrixForm[Q], MatrixForm[L], MatrixForm[Q . L . Transpose[Q]]}
```

```code
S = {{2, 2, -2}, {2, 5, -4}, {-2, -4, 5}};
{vals, vecs} = Eigensystem[S];      (* 固有値・固有ベクトル *)
Q = Transpose[Orthogonalize[vecs]]; (* 正規直交な固有ベクトル *)
L = DiagonalMatrix[vals];           (* 対角行列 *)
{MatrixForm[Q], MatrixForm[L], MatrixForm[Q . L . Transpose[Q]]}
```

```code
PositiveSemidefiniteMatrixQ[{{4, 2}, {2, 1}}]
```

```code
A = {{4, 2}, {2, 1}};
AllTrue[Eigenvalues[A], NonNegative]
```

```code
A = {{46, 46}, {46, 86}};
{v1, v2} = Eigenvectors[N[A]][[1]]
```

```code
x1 = {1, 3, 6, 10}; y = {7, 1, 6, 14};
X = Transpose[{x1 - Mean[x1], y - Mean[y]}];
A = Transpose[X] . X
```

```code
Reduce[v1 (yp - Mean[y]) == v2 (xp - Mean[x1]), yp] // N
```

```code
{U, S, V} = SingularValueDecomposition[X];
V[[All, 1]] // N
```

# 20 特異値分解と疑似逆行列

```code
A = {{1, 0}, {1, 1}, {0, 1}};
{U, S, V} = SingularValueDecomposition[A];
{MatrixForm[U], MatrixForm[S], MatrixForm[Transpose[V]],
 MatrixForm[U . S . Transpose[V]]}
```

```code
A = {{1, 0}, {1, 1}, {0, 1}};
G = Transpose[A] . A;                                    (* 1 *)
{vals, vecs} = Eigensystem[G];                           (* 2 *)
s = Sqrt[Select[vals, Positive]]; S = DiagonalMatrix[s]; (* 3 *)
r = Length[s];                                           (* 4 *)
Vt = Orthogonalize[Take[vecs, r]]; V = Transpose[Vt];    (* 5 *)
U = A . V . Inverse[S];                                  (* 6 *)
{MatrixForm[U], MatrixForm[S], MatrixForm[Vt], MatrixForm[U . S . Vt]}
```

```code
A = {{1, 0}, {1, 1}, {0, 1}}; b = {2, 0, 2};
PseudoInverse[A] . b
```

