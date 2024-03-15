url = "https://raw.githubusercontent.com/taroyabuki/comath/main/code/\
mathematica/mathematica.md";
md = Drop[Import[url, {"Text", "Lines"}], 6];

nb = EvaluationNotebook[];

NotebookWrite[nb, Cell[TextData[
  ButtonBox["矢吹太朗『コンピュータでとく数学』（オーム社, 2024）",
    BaseStyle -> "Hyperlink",
    ButtonData -> {URL["https://github.com/taroyabuki/comath"], None},
    ButtonNote -> "https://github.com/taroyabuki/comath"]], "Text"]];

brackets[line_] := And[
  StringCount[line, "("] == StringCount[line, ")"],
  StringCount[line, "{"] == StringCount[line, "}"],
  StringCount[line, "["] == StringCount[line, "]"],
  StringCount[line, "<|"] == StringCount[line, "|>"]]

Do[If[And[StringLength[line] > 1, StringPart[line, 1] == "#"], 
  NotebookWrite[nb, Cell[StringDrop[line, 2], "Chapter"], PageBreakAbove -> True],
  If[line == "```",
   in = False;
   NotebookWrite[nb, Cell[BoxData[Drop[cell, -1]], "Input"]],
   If[line == "```code", in = True; cell = {}; box = "",
    If[in,
     box = box <> line <> "\n";
     If[And[StringLength[line] > 1, StringPart[line, -1] != "=", brackets[box]],
      AppendTo[cell, RowBox[{StringDrop[box, -1]}]];
      AppendTo[cell, "\n"];
      box = ""]]]]],
 {line, md}]

SelectionMove[nb, All, Notebook];
FrontEndExecute[FrontEndToken[nb, "SelectionCloseAllGroups"]];
