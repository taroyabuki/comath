nb = EvaluationNotebook[];

url = "https://raw.githubusercontent.com/taroyabuki/comath/main/code/mathematica.md";

md = Drop[Import[url, {"Text", "Lines"}], 6];

in = False; cell = "";
Do[
 If[And[StringLength[line] > 1, StringTake[line, 1] == "#"],
  NotebookWrite[nb, Cell[StringDrop[line, 2], "Chapter"]],
  If[line == "```",
   in = False;
   NotebookWrite[nb, Cell[StringDrop[cell, -1], "Input"]],
   If[line == "```code",
    in = True;
    cell = "",
    If[in, cell = cell <> line <> "\n"]]]],
 {line, md}]
