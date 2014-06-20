grammar MiniZincGrammar;
import MiniZincLexer;
model: (stat ';')+;
stat: data
    | constraint
    | decl
    | solve
    | output
    | predicate
    | function
    | include
    | init
    ;  

decl : vardecl | pardecl;
vardecl : (var | vararray) ('=' expr)?;
pardecl : parameter | pararray;

data: 'enum' ID '=' '{' constr(','constr)* '}';
constraint : 'constraint'  expr;
var : 'var' typename ':'  ID ;
output :'output' '(' listExpr ')' | 'output'  listExpr ;
solve : 'solve' (annotation)? (satisfy | optimize);
parameter : 'par'? typename ':'  ID ('=' expr)?;
include : 'include' stringExpr;
init : ID '=' expr;


// predicates and functions
predicate : 'predicate' ID'(' (decl(','decl)*)? ')' '=' expr;
function : 'function';

satisfy : 'satisfy';
optimize : maximize | minimize;
maximize : 'maximize' expr;
minimize : 'minimize' expr;

// annotations
annotation : '::' modeAnnotation;
modeAnnotation : intS | boolS | setS | seqS;
intS  : 'int_search'  restS;
boolS : 'bool_search' restS;
setS  : 'set_search'  restS;
seqS  : 'seq_search' '('? '[' modeAnnotation (','modeAnnotation)* ']'')'?;
restS : '(' expr ',' varchoice ',' constrainchoice ',' 'complete' ')';
varchoice : 'input_order' | 'first_fail' | 'smallest';
constrainchoice: 'indomain'
      | 'indomain_min' 
      | 'indomain_median' 
      | 'indomain_random' 
      | 'indomain_split';

constr: scons | tcons;
scons: ID ;
tcons: ID '('arg (','arg)*')' ;
arg : argint 
    | argfloat
    | argbool
    | argunion
    | argrange
    ;
argint   : rint;
argfloat : rfloat;
argbool  : rbool;
argunion : ID;
argrange : range;

typename : rint
         | rbool
         | rfloat 
         | ID 
         | typedata
         | range
         | typeset
          ;
typeset : 'set' 'of' typename;
vararray : 'array' dimensions 'of' var;
pararray : 'array' dimensions 'of'  parameter;
dimensions : '[' ((range  (','range)*) | 'int') ']';


typedata : ID'('integer')';

expr:  
    | rbracketExpr
    | boolComplexExpr
    | arithComplexExpr
    | setExpr    
    | listExpr
    | expr infixOp expr
    | ifExpr 
    | letExpr 
    | guardExpr
    | predOrUnionExpr 
    | stringExpr 
    | BOOL
    | real
    | integer
    | ID
    | '_'
        ;


boolVal : 
      | '(' boolExpr ')'
      | ID 
      | BOOL 
      | arrayaccess 
      | ifExpr 
      | letExpr 
      | predOrUnionExpr 
      | guardExpr
      ;

boolComplexExpr:     
     boolExpr ('/\\'|'\\/'| 'xor'| '->'|'<-'|'<->' | '=' | '==' | '!=') boolExpr  
    |   arithExpr ('<'|'>' |'>=' | '<=' | '=' | '==' | '!=' | 'in' ) arithExpr       
    |   notExpr  
    ;

boolExpr :      
     boolExpr ('/\\'|'\\/'| 'xor' | '->'|'<-'|'<->' | '=' | '==' | '!=') boolExpr     
    |   arithExpr ('<'|'>' |'>=' | '<=' | '=' | '==' | '!=' | 'in' ) expr
    |   notExpr  
    |   boolVal
    ;

operand : ID 
    | integer 
    | real
    |  arrayaccess 
    | ifExpr 
    | letExpr 
    |  '('arithExpr ')'
    | predOrUnionExpr 
    | functionExpr
    ;
   
arithComplexExpr :
         minusExpr
    |   arithExpr ('*'|'/'| 'div'| 'mod' | '+'|'-') arithExpr   
   ;
  
arithExpr : 
         minusExpr
    |   arithExpr ('*'|'/'| 'div' | 'mod' | '+'|'-') arithExpr   
    |   operand
   ;


notExpr        : 'not'  expr ;
minusExpr      :  '-'  arithExpr ;
predOrUnionExpr: ID '('expr (','expr)*')';
rbracketExpr    :  '(' expr ')';
idexpr : ID;
stringExpr : '"' string  '"';
infixOp : '`' ID  '`'  | infixSetOp;
infixSetOp : 'in' | 'intersect' | 'union' ;
arrayaccess : ID '[' expr(','expr)* ']' | '[' (expr(','expr)*)? ']' '[' expr(','expr)* ']';



// lists
listExpr: listValue 
          | listExpr '++' expr
          | oneDimList 
          | multiDimList ;
oneDimList :  simpleList | guardedList  ;
// the , at the end is allowed by MiniZinc
simpleList : '[' (expr (','expr)*)? (',')? ']';
guardedList : '[' (expr (','expr)*)? '|'  inDecl (',' inDecl)* ']' ;
multiDimList : '[|' (expr (','expr)*)? ((',')?'|' expr (','expr)*  )*  '|]' ;

listValue : stringExpr | ID | ifExpr | arrayaccess | showExpr | inDecl | functionExpr;
showExpr : 'show' '(' expr ')';

functionExpr : guardExpr;

guardExpr : forall | exists | sum | prod |max | min |  bool2int | alldifferent |
            array1d;
forall : 'forall' guardExprArg;
exists : 'exists'  guardExprArg;
sum : 'sum'  guardExprArg;
prod : 'prod'  guardExprArg;
max : 'max'  guardExprArg | 'max' '(' expr ',' expr ')';
min : 'min'  guardExprArg | 'max' '(' expr ',' expr ')';
bool2int : 'bool2int' '('expr')';
alldifferent : 'alldifferent' guardExprArg;
array1d : 'array1d' '(' expr ',' expr ')';

// forall, exists, sum, prod
//guardExpr : ID guardExprArg;

guardExprArg : twoSections | oneSection;

oneSection  : '(' listExpr ')';
twoSections : '(' inDecl (',' inDecl)*')' '(' expr ')';

inDecl : ID (','ID)* 'in' setExpr whereCond?;
whereCond : 'where' expr;

// let
letExpr : 'let' '{' decl   (',' decl)* '}' 'in' expr;

// if
ifExpr : 'if' bodyIf ;
bodyIf : expr 'then' expr (elseS | elseifS) ;
elseS : 'else' expr 'endif';
elseifS : 'elseif' bodyIf;

// sets
setVal : bracketExpr | range | guardedSet ;
complexSetExpr :  setExpr infixSetOp setExpr;
setExpr : setVal | setExpr infixSetOp setExpr;
bracketExpr : '{'(expr (','expr)*)? '}';
guardedSet : '{' (expr (','expr)*)? '|'  inDecl (',' inDecl)* '}' ;


range : fromR '..' toR
      | ID
      ;

fromR : arithExpr;
toR  : arithExpr;
rint   : 'int';
rfloat : 'float';
rbool  : 'bool';
integer : NAT | '-' NAT;
real : integer '.' NAT;

string : ((~('"') | ESC | '.' | '^'| '#'))*;
//string : (ESC|.)*?;
ESC:'\\"' | '\\\\' | '\\n' | '\\t';

