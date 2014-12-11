% MiniZinc Model parsed using Antlr4
% Rafael Caballero, 2014



% 
% Data definitions: 
% enum op= {sum,minus,prod,divi}
% enum tree= {leaf(2..2),node(op,tree,tree)}
% ------------------ 

% Declarations Section
var 1..2:t;
var 2..2:t_1_1;
var 1..4:t_2_1;
var 1..2:t_2_2;
var 2..2:t_2_2_1_1;
var 1..4:t_2_2_2_1;
var 1..2:t_2_2_2_2;
var 1..2:t_2_2_2_3;
var 1..2:t_2_3;
var 2..2:t_2_3_1_1;
var 1..4:t_2_3_2_1;
var 1..2:t_2_3_2_2;
var 1..2:t_2_3_2_3;
var bool:t_b;
var bool:t_2_2_b;
var bool:t_2_2_2_2_b;
var bool:t_2_2_2_3_b;
var bool:t_2_3_b;
var bool:t_2_3_2_2_b;
var bool:t_2_3_2_3_b;
var 1..2:s;
var 2..2:s_1_1;
var 1..4:s_2_1;
var 1..2:s_2_2;
var 2..2:s_2_2_1_1;
var 1..4:s_2_2_2_1;
var 1..2:s_2_2_2_2;
var 2..2:s_2_2_2_2_1_1;
var 1..4:s_2_2_2_2_2_1;
var 1..2:s_2_2_2_2_2_2;
var 1..2:s_2_2_2_2_2_3;
var 1..2:s_2_2_2_3;
var 2..2:s_2_2_2_3_1_1;
var 1..4:s_2_2_2_3_2_1;
var 1..2:s_2_2_2_3_2_2;
var 1..2:s_2_2_2_3_2_3;
var 1..2:s_2_3;
var 2..2:s_2_3_1_1;
var 1..4:s_2_3_2_1;
var 1..2:s_2_3_2_2;
var 2..2:s_2_3_2_2_1_1;
var 1..4:s_2_3_2_2_2_1;
var 1..2:s_2_3_2_2_2_2;
var 1..2:s_2_3_2_2_2_3;
var 1..2:s_2_3_2_3;
var 2..2:s_2_3_2_3_1_1;
var 1..4:s_2_3_2_3_2_1;
var 1..2:s_2_3_2_3_2_2;
var 1..2:s_2_3_2_3_2_3;
var bool:s_b;
var bool:s_2_2_b;
var bool:s_2_2_2_2_b;
var bool:s_2_2_2_2_2_2_b;
var bool:s_2_2_2_2_2_3_b;
var bool:s_2_2_2_3_b;
var bool:s_2_2_2_3_2_2_b;
var bool:s_2_2_2_3_2_3_b;
var bool:s_2_3_b;
var bool:s_2_3_2_2_b;
var bool:s_2_3_2_2_2_2_b;
var bool:s_2_3_2_2_2_3_b;
var bool:s_2_3_2_3_b;
var bool:s_2_3_2_3_2_2_b;
var bool:s_2_3_2_3_2_3_b;

% Constraints Section
constraint not (1 = 1 /\ s = 2 /\ s_2_1 = 4 /\ s_2_2 = 1 /\ s_2_2_1_1 = 2 /\ s_2_3_2_2 = t_2_3_2_2 /\ s_2_3_2_3 = t_2_3_2_3 /\ s_2_3_1_1 = t_2_3_1_1 /\ s_2_3_2_1 = t_2_3_2_1 /\ s_2_3 = t_2_3 /\ 2 = 2);
constraint t_2_2_2_2_b = (t_2_2_2_2 != 1 /\ t_2_2_2_2 != 2);
constraint t_2_2_2_3_b = (t_2_2_2_3 != 1 /\ t_2_2_2_3 != 2);
constraint t_2_2_b = ((t_2_2 != 1 -> t_2_2_1_1 = 2) /\ (t_2_2 != 2 -> t_2_2_2_1 = 1 /\ t_2_2_2_2 = 1 /\ t_2_2_2_3 = 1) /\ (t_2_2 = 2 -> t_2_2_2_2_b /\ t_2_2_2_3_b));
constraint t_2_3_2_2_b = (t_2_3_2_2 != 1 /\ t_2_3_2_2 != 2);
constraint t_2_3_2_3_b = (t_2_3_2_3 != 1 /\ t_2_3_2_3 != 2);
constraint t_2_3_b = ((t_2_3 != 1 -> t_2_3_1_1 = 2) /\ (t_2_3 != 2 -> t_2_3_2_1 = 1 /\ t_2_3_2_2 = 1 /\ t_2_3_2_3 = 1) /\ (t_2_3 = 2 -> t_2_3_2_2_b /\ t_2_3_2_3_b));
constraint t_b = ((t != 1 -> t_1_1 = 2) /\ (t != 2 -> t_2_1 = 1 /\ t_2_2 = 1 /\ t_2_2_1_1 = 2 /\ t_2_2_2_1 = 1 /\ t_2_2_2_2 = 1 /\ t_2_2_2_3 = 1 /\ t_2_3 = 1 /\ t_2_3_1_1 = 2 /\ t_2_3_2_1 = 1 /\ t_2_3_2_2 = 1 /\ t_2_3_2_3 = 1) /\ (t = 2 -> t_2_2_b /\ t_2_3_b));
constraint t_b;
constraint s_2_2_2_2_2_2_b = (s_2_2_2_2_2_2 != 1 /\ s_2_2_2_2_2_2 != 2);
constraint s_2_2_2_2_2_3_b = (s_2_2_2_2_2_3 != 1 /\ s_2_2_2_2_2_3 != 2);
constraint s_2_2_2_2_b = ((s_2_2_2_2 != 1 -> s_2_2_2_2_1_1 = 2) /\ (s_2_2_2_2 != 2 -> s_2_2_2_2_2_1 = 1 /\ s_2_2_2_2_2_2 = 1 /\ s_2_2_2_2_2_3 = 1) /\ (s_2_2_2_2 = 2 -> s_2_2_2_2_2_2_b /\ s_2_2_2_2_2_3_b));
constraint s_2_2_2_3_2_2_b = (s_2_2_2_3_2_2 != 1 /\ s_2_2_2_3_2_2 != 2);
constraint s_2_2_2_3_2_3_b = (s_2_2_2_3_2_3 != 1 /\ s_2_2_2_3_2_3 != 2);
constraint s_2_2_2_3_b = ((s_2_2_2_3 != 1 -> s_2_2_2_3_1_1 = 2) /\ (s_2_2_2_3 != 2 -> s_2_2_2_3_2_1 = 1 /\ s_2_2_2_3_2_2 = 1 /\ s_2_2_2_3_2_3 = 1) /\ (s_2_2_2_3 = 2 -> s_2_2_2_3_2_2_b /\ s_2_2_2_3_2_3_b));
constraint s_2_2_b = ((s_2_2 != 1 -> s_2_2_1_1 = 2) /\ (s_2_2 != 2 -> s_2_2_2_1 = 1 /\ s_2_2_2_2 = 1 /\ s_2_2_2_2_1_1 = 2 /\ s_2_2_2_2_2_1 = 1 /\ s_2_2_2_2_2_2 = 1 /\ s_2_2_2_2_2_3 = 1 /\ s_2_2_2_3 = 1 /\ s_2_2_2_3_1_1 = 2 /\ s_2_2_2_3_2_1 = 1 /\ s_2_2_2_3_2_2 = 1 /\ s_2_2_2_3_2_3 = 1) /\ (s_2_2 = 2 -> s_2_2_2_2_b /\ s_2_2_2_3_b));
constraint s_2_3_2_2_2_2_b = (s_2_3_2_2_2_2 != 1 /\ s_2_3_2_2_2_2 != 2);
constraint s_2_3_2_2_2_3_b = (s_2_3_2_2_2_3 != 1 /\ s_2_3_2_2_2_3 != 2);
constraint s_2_3_2_2_b = ((s_2_3_2_2 != 1 -> s_2_3_2_2_1_1 = 2) /\ (s_2_3_2_2 != 2 -> s_2_3_2_2_2_1 = 1 /\ s_2_3_2_2_2_2 = 1 /\ s_2_3_2_2_2_3 = 1) /\ (s_2_3_2_2 = 2 -> s_2_3_2_2_2_2_b /\ s_2_3_2_2_2_3_b));
constraint s_2_3_2_3_2_2_b = (s_2_3_2_3_2_2 != 1 /\ s_2_3_2_3_2_2 != 2);
constraint s_2_3_2_3_2_3_b = (s_2_3_2_3_2_3 != 1 /\ s_2_3_2_3_2_3 != 2);
constraint s_2_3_2_3_b = ((s_2_3_2_3 != 1 -> s_2_3_2_3_1_1 = 2) /\ (s_2_3_2_3 != 2 -> s_2_3_2_3_2_1 = 1 /\ s_2_3_2_3_2_2 = 1 /\ s_2_3_2_3_2_3 = 1) /\ (s_2_3_2_3 = 2 -> s_2_3_2_3_2_2_b /\ s_2_3_2_3_2_3_b));
constraint s_2_3_b = ((s_2_3 != 1 -> s_2_3_1_1 = 2) /\ (s_2_3 != 2 -> s_2_3_2_1 = 1 /\ s_2_3_2_2 = 1 /\ s_2_3_2_2_1_1 = 2 /\ s_2_3_2_2_2_1 = 1 /\ s_2_3_2_2_2_2 = 1 /\ s_2_3_2_2_2_3 = 1 /\ s_2_3_2_3 = 1 /\ s_2_3_2_3_1_1 = 2 /\ s_2_3_2_3_2_1 = 1 /\ s_2_3_2_3_2_2 = 1 /\ s_2_3_2_3_2_3 = 1) /\ (s_2_3 = 2 -> s_2_3_2_2_b /\ s_2_3_2_3_b));
constraint s_b = ((s != 1 -> s_1_1 = 2) /\ (s != 2 -> s_2_1 = 1 /\ s_2_2 = 1 /\ s_2_2_1_1 = 2 /\ s_2_2_2_1 = 1 /\ s_2_2_2_2 = 1 /\ s_2_2_2_2_1_1 = 2 /\ s_2_2_2_2_2_1 = 1 /\ s_2_2_2_2_2_2 = 1 /\ s_2_2_2_2_2_3 = 1 /\ s_2_2_2_3 = 1 /\ s_2_2_2_3_1_1 = 2 /\ s_2_2_2_3_2_1 = 1 /\ s_2_2_2_3_2_2 = 1 /\ s_2_2_2_3_2_3 = 1 /\ s_2_3 = 1 /\ s_2_3_1_1 = 2 /\ s_2_3_2_1 = 1 /\ s_2_3_2_2 = 1 /\ s_2_3_2_2_1_1 = 2 /\ s_2_3_2_2_2_1 = 1 /\ s_2_3_2_2_2_2 = 1 /\ s_2_3_2_2_2_3 = 1 /\ s_2_3_2_3 = 1 /\ s_2_3_2_3_1_1 = 2 /\ s_2_3_2_3_2_1 = 1 /\ s_2_3_2_3_2_2 = 1 /\ s_2_3_2_3_2_3 = 1) /\ (s = 2 -> s_2_2_b /\ s_2_3_b));
constraint s_b;

% Solve Section
solve  satisfy;

% Output Section
output(["t: ",if (fix(t) = 1) 
then 
     "leaf" ++ "(" ++ show(t_1_1) ++ ")"
else 
     if (fix(t) = 2) 
     then 
          "node" ++ "(" ++ if (fix(t_2_1) = 1) 
then 
     "sum"
else 
     if (fix(t_2_1) = 2) 
     then 
          "minus"
     else 
          if (fix(t_2_1) = 3) 
          then 
               "prod"
          else 
               if (fix(t_2_1) = 4) 
               then 
                    "divi"
               else 
                    ""
               endif
          endif
     endif
endif ++ ", " ++ if (fix(t_2_2) = 1) 
then 
     "leaf" ++ "(" ++ show(t_2_2_1_1) ++ ")"
else 
     if (fix(t_2_2) = 2) 
     then 
          "node" ++ "(" ++ if (fix(t_2_2_2_1) = 1) 
then 
     "sum"
else 
     if (fix(t_2_2_2_1) = 2) 
     then 
          "minus"
     else 
          if (fix(t_2_2_2_1) = 3) 
          then 
               "prod"
          else 
               if (fix(t_2_2_2_1) = 4) 
               then 
                    "divi"
               else 
                    ""
               endif
          endif
     endif
endif ++ ", " ++ ")"
     else 
          ""
     endif
endif ++ ", " ++ if (fix(t_2_3) = 1) 
then 
     "leaf" ++ "(" ++ show(t_2_3_1_1) ++ ")"
else 
     if (fix(t_2_3) = 2) 
     then 
          "node" ++ "(" ++ if (fix(t_2_3_2_1) = 1) 
then 
     "sum"
else 
     if (fix(t_2_3_2_1) = 2) 
     then 
          "minus"
     else 
          if (fix(t_2_3_2_1) = 3) 
          then 
               "prod"
          else 
               if (fix(t_2_3_2_1) = 4) 
               then 
                    "divi"
               else 
                    ""
               endif
          endif
     endif
endif ++ ", " ++ ")"
     else 
          ""
     endif
endif ++ ")"
     else 
          ""
     endif
endif,"\n","s: ",if (fix(s) = 1) 
then 
     "leaf" ++ "(" ++ show(s_1_1) ++ ")"
else 
     if (fix(s) = 2) 
     then 
          "node" ++ "(" ++ if (fix(s_2_1) = 1) 
then 
     "sum"
else 
     if (fix(s_2_1) = 2) 
     then 
          "minus"
     else 
          if (fix(s_2_1) = 3) 
          then 
               "prod"
          else 
               if (fix(s_2_1) = 4) 
               then 
                    "divi"
               else 
                    ""
               endif
          endif
     endif
endif ++ ", " ++ if (fix(s_2_2) = 1) 
then 
     "leaf" ++ "(" ++ show(s_2_2_1_1) ++ ")"
else 
     if (fix(s_2_2) = 2) 
     then 
          "node" ++ "(" ++ if (fix(s_2_2_2_1) = 1) 
then 
     "sum"
else 
     if (fix(s_2_2_2_1) = 2) 
     then 
          "minus"
     else 
          if (fix(s_2_2_2_1) = 3) 
          then 
               "prod"
          else 
               if (fix(s_2_2_2_1) = 4) 
               then 
                    "divi"
               else 
                    ""
               endif
          endif
     endif
endif ++ ", " ++ if (fix(s_2_2_2_2) = 1) 
then 
     "leaf" ++ "(" ++ show(s_2_2_2_2_1_1) ++ ")"
else 
     if (fix(s_2_2_2_2) = 2) 
     then 
          "node" ++ "(" ++ if (fix(s_2_2_2_2_2_1) = 1) 
then 
     "sum"
else 
     if (fix(s_2_2_2_2_2_1) = 2) 
     then 
          "minus"
     else 
          if (fix(s_2_2_2_2_2_1) = 3) 
          then 
               "prod"
          else 
               if (fix(s_2_2_2_2_2_1) = 4) 
               then 
                    "divi"
               else 
                    ""
               endif
          endif
     endif
endif ++ ", " ++ ")"
     else 
          ""
     endif
endif ++ ", " ++ if (fix(s_2_2_2_3) = 1) 
then 
     "leaf" ++ "(" ++ show(s_2_2_2_3_1_1) ++ ")"
else 
     if (fix(s_2_2_2_3) = 2) 
     then 
          "node" ++ "(" ++ if (fix(s_2_2_2_3_2_1) = 1) 
then 
     "sum"
else 
     if (fix(s_2_2_2_3_2_1) = 2) 
     then 
          "minus"
     else 
          if (fix(s_2_2_2_3_2_1) = 3) 
          then 
               "prod"
          else 
               if (fix(s_2_2_2_3_2_1) = 4) 
               then 
                    "divi"
               else 
                    ""
               endif
          endif
     endif
endif ++ ", " ++ ")"
     else 
          ""
     endif
endif ++ ")"
     else 
          ""
     endif
endif ++ ", " ++ if (fix(s_2_3) = 1) 
then 
     "leaf" ++ "(" ++ show(s_2_3_1_1) ++ ")"
else 
     if (fix(s_2_3) = 2) 
     then 
          "node" ++ "(" ++ if (fix(s_2_3_2_1) = 1) 
then 
     "sum"
else 
     if (fix(s_2_3_2_1) = 2) 
     then 
          "minus"
     else 
          if (fix(s_2_3_2_1) = 3) 
          then 
               "prod"
          else 
               if (fix(s_2_3_2_1) = 4) 
               then 
                    "divi"
               else 
                    ""
               endif
          endif
     endif
endif ++ ", " ++ if (fix(s_2_3_2_2) = 1) 
then 
     "leaf" ++ "(" ++ show(s_2_3_2_2_1_1) ++ ")"
else 
     if (fix(s_2_3_2_2) = 2) 
     then 
          "node" ++ "(" ++ if (fix(s_2_3_2_2_2_1) = 1) 
then 
     "sum"
else 
     if (fix(s_2_3_2_2_2_1) = 2) 
     then 
          "minus"
     else 
          if (fix(s_2_3_2_2_2_1) = 3) 
          then 
               "prod"
          else 
               if (fix(s_2_3_2_2_2_1) = 4) 
               then 
                    "divi"
               else 
                    ""
               endif
          endif
     endif
endif ++ ", " ++ ")"
     else 
          ""
     endif
endif ++ ", " ++ if (fix(s_2_3_2_3) = 1) 
then 
     "leaf" ++ "(" ++ show(s_2_3_2_3_1_1) ++ ")"
else 
     if (fix(s_2_3_2_3) = 2) 
     then 
          "node" ++ "(" ++ if (fix(s_2_3_2_3_2_1) = 1) 
then 
     "sum"
else 
     if (fix(s_2_3_2_3_2_1) = 2) 
     then 
          "minus"
     else 
          if (fix(s_2_3_2_3_2_1) = 3) 
          then 
               "prod"
          else 
               if (fix(s_2_3_2_3_2_1) = 4) 
               then 
                    "divi"
               else 
                    ""
               endif
          endif
     endif
endif ++ ", " ++ ")"
     else 
          ""
     endif
endif ++ ")"
     else 
          ""
     endif
endif ++ ")"
     else 
          ""
     endif
endif,"\n"]);


