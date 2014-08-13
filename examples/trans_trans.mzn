Parser errror. Unexpected InfixOp `rightof`
Parser errror. Unexpected InfixOp `nextto`
Parser errror. Unexpected InfixOp `nextto`
Parser errror. Unexpected InfixOp `nextto`
include "globals.mzn";
set of int:Nationalities = 0..4;
int:English = 0;
int:Spanish = 1;
int:Ukrainian = 2;
int:Norwegian = 3;
int:Japanese = 4;
set of int:Colours = 0..4;
int:Red = 0;
int:Green = 1;
int:Ivory = 2;
int:Yellow = 3;
int:Blue = 4;
set of int:Animals = 0..4;
int:Dog = 0;
int:Fox = 1;
int:Horse = 2;
int:Zebra = 3;
int:Snails = 4;
set of int:Drinks = 0..4;
int:Coffee = 0;
int:Tea = 1;
int:Milk = 2;
int:OrangeJuice = 3;
int:Water = 4;
set of int:Cigarettes = 0..4;
int:OldGold = 0;
int:Kools = 1;
int:Chesterfields = 2;
int:LuckyStrike = 3;
int:Parliaments = 4;
set of int:Houses = 1..5;
array [Nationalities] of  var Houses:nation;
array [Colours] of  var Houses:colour;
array [Animals] of  var Houses:animal;
array [Drinks] of  var Houses:drink;
array [Cigarettes] of  var Houses:smoke;
predicate nextto(var Houses:h1,var Houses:h2)=
h1 == h2 + 1 \/ h2 == h1 + 1;
predicate rightof(var Houses:h1,var Houses:h2)=
h1 == h2 + 1;
predicate middle(var Houses:h)=
h == 3;
predicate left(var Houses:h)=
h = 1;
constraint alldifferent(nation) /\ alldifferent(colour) /\ alldifferent(animal) /\ alldifferent(drink) /\ alldifferent(smoke) /\ nation[English] == colour[Red] /\ nation[Spanish] == animal[Dog] /\ drink[Coffee] == colour[Green] /\ nation[Ukrainian] == drink[Tea] /\ colour[Green] 'rightof' colour[Ivory] /\ smoke[OldGold] == animal[Snails] /\ smoke[Kools] == colour[Yellow] /\ middle(drink[Milk]) /\ left(nation[Norwegian]) /\ smoke[Chesterfields] 'nextto' animal[Fox] /\ smoke[Kools] 'nextto' animal[Horse] /\ smoke[LuckyStrike] == drink[OrangeJuice] /\ nation[Japanese] == smoke[Parliaments] /\ nation[Norwegian] 'nextto' colour[Blue];
solve  satisfy;
output(["zebra:\n","nation = [",show(nation[0]),", ",show(nation[1]),", ",show(nation[2]),", ",show(nation[3]),", ",show(nation[4]),"]\n","colour = [",show(colour[0]),", ",show(colour[1]),", ",show(colour[2]),", ",show(colour[3]),", ",show(colour[4]),"]\n","animal = [",show(animal[0]),", ",show(animal[1]),", ",show(animal[2]),", ",show(animal[3]),", ",show(animal[4]),"]\n","drink  = [",show(drink[0]),", ",show(drink[1]),", ",show(drink[2]),", ",show(drink[3]),", ",show(drink[4]),"]\n","smoke  = [",show(smoke[0]),", ",show(smoke[1]),", ",show(smoke[2]),", ",show(smoke[3]),", ",show(smoke[4]),"]\n"]);

