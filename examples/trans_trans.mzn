% MiniZinc Model parsed using Antlr4
% Rafael Caballero, 2014



% Data Section
enum op= {sum,minus,prod,divi};
enum tree= {leaf(2..3),node(op,tree,tree)};

% Declarations Section
var 1..2:t;
var 1..4:t_2_1;
var 1..2:t_2_2;
var 1..4:t_2_2_2_1;
var 1..2:t_2_2_2_2;
var 1..2:t_2_2_2_3;
var 1..2:t_2_3;
var 1..4:t_2_3_2_1;
var 1..2:t_2_3_2_2;
var 1..2:t_2_3_2_3;

% Constraints Section
constraint t != node(sum,leaf(2),leaf(3));
constraint t != 1 ->  /\ t = 1 -> true /\ t != 2 -> t_2_1 = 1 /\ t_2_2 = 1 /\ t_2_2_2_1 = 1 /\ t_2_2_2_2 = 1 /\ t_2_2_2_3 = 1 /\ t_2_3 = 1 /\ t_2_3_2_1 = 1 /\ t_2_3_2_2 = 1 /\ t_2_3_2_3 = 1 /\ t = 2 -> t_2_1 != 1 ->  /\ t_2_1 = 1 ->  /\ t_2_1 != 2 ->  /\ t_2_1 = 2 ->  /\ t_2_1 != 3 ->  /\ t_2_1 = 3 ->  /\ t_2_1 != 4 ->  /\ t_2_1 = 4 ->  /\ t_2_2 != 1 ->  /\ t_2_2 = 1 -> true /\ t_2_2 != 2 -> t_2_2_2_1 = 1 /\ t_2_2_2_2 = 1 /\ t_2_2_2_3 = 1 /\ t_2_2 = 2 -> true /\ t_2_2_2_2 != 1 /\ t_2_2_2_2 != 2 /\ t_2_2_2_3 != 1 /\ t_2_2_2_3 != 2 /\ t_2_3 != 1 ->  /\ t_2_3 = 1 -> true /\ t_2_3 != 2 -> t_2_3_2_1 = 1 /\ t_2_3_2_2 = 1 /\ t_2_3_2_3 = 1 /\ t_2_3 = 2 -> true /\ t_2_3_2_2 != 1 /\ t_2_3_2_2 != 2 /\ t_2_3_2_3 != 1 /\ t_2_3_2_3 != 2;

% Output Section
output(["t: ",show(t),"\n"]);


