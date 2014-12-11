
enum op = {sum , minus , prod , divi};
enum tree  = { leaf(2..3), node(op, tree, tree) };
var tree(2):t;
constraint t != node(sum,leaf(2),leaf(3));
output(["t: ",show(t),"\n"]);
